resource "null_resource" "docker-swarm-manager" {
  count = var.managers
  depends_on = [yandex_compute_instance.instance-manager]
  connection {
    user        = var.ssh_credentials.user
    private_key = file(var.ssh_credentials.private_key)
    host        = yandex_compute_instance.instance-manager[count.index].network_interface.0.nat_ip_address
  }

  provisioner "remote-exec" {
    inline = [
      "curl -fsSL https://get.docker.com | sudo sh",
      "sudo usermod -aG docker $USER",
      "sleep 5",
      "sudo docker swarm init --advertise-addr ${yandex_compute_instance.instance-manager[count.index].network_interface.0.ip_address}",
      "sleep 10",
      "echo COMPLETED"
    ]
  }
}

resource "null_resource" "docker-swarm-manager-join" {
  count = var.managers
  depends_on = [yandex_compute_instance.instance-manager, null_resource.docker-swarm-manager]
  connection {
    user        = var.ssh_credentials.user
    private_key = file(var.ssh_credentials.private_key)
    host        = yandex_compute_instance.instance-manager[count.index].network_interface.0.nat_ip_address
  }
  
  provisioner "file" {
    source      = "~\\.ssh\\id_rsa"
    destination = "/home/${var.ssh_credentials.user}/.ssh/id_rsa"
  }

  provisioner "remote-exec" {
    inline = [ "chown titov:titov ~/.ssh/id_rsa && chmod 600 ~/.ssh/id_rsa",
              "TOKEN=$(docker swarm join-token -q worker); echo \"#!/usr/bin/env bash\nsudo docker swarm join --token $TOKEN ${yandex_compute_instance.instance-manager[count.index].network_interface.0.ip_address}:2377\nexit 0\" > join.sh",
               "scp -o StrictHostKeyChecking=no ~/join.sh  ${var.ssh_credentials.user}@${yandex_compute_instance.instance-worker[count.index].network_interface.0.ip_address}:~"]
  }

}

resource "null_resource" "docker-swarm-worker" {
  count = var.workers
  depends_on = [yandex_compute_instance.instance-worker, null_resource.docker-swarm-manager-join]
  connection {
    user        = var.ssh_credentials.user
    private_key = file(var.ssh_credentials.private_key)
    host        = yandex_compute_instance.instance-worker[count.index].network_interface.0.nat_ip_address
  }

  provisioner "remote-exec" {
    inline = [
      "curl -fsSL https://get.docker.com | sudo sh",
      "sudo usermod -aG docker $USER",
      "sudo chmod +x ~/join.sh",
      "sudo ~/join.sh"
    ]
  }
}

resource "null_resource" "docker-swarm-manager-start" {
  depends_on = [yandex_compute_instance.instance-manager, null_resource.docker-swarm-worker]
  connection {
    user        = var.ssh_credentials.user
    private_key = file(var.ssh_credentials.private_key)
    host        = yandex_compute_instance.instance-manager[0].network_interface.0.nat_ip_address
  }

  provisioner "file" {
    source      = "docker-compose\\docker-compose.yml"
    destination = "/home/${var.ssh_credentials.user}/docker-compose.yml"
  }

  provisioner "remote-exec" {
    inline = [
        "docker stack deploy -c ~/docker-compose.yml sockshop-swarm"
    ]
  }

}
