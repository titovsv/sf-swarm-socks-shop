resource "yandex_compute_instance" "instance-manager" {

  allow_stopping_for_update = true
  count                     = var.managers

  name      = "swarm-manager-${count.index + 1}"
  hostname  = "swarm-manager-${count.index + 1}"
  folder_id = var.folder_id
  zone      = var.zone

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.disk
    }
  }

  network_interface {
    subnet_id      = var.subnet_id
    ipv4           = var.ipv4
    ipv6           = var.ipv6
    nat            = var.nat
  }

  metadata = {
    user-data = "${file(var.user_data)}"
  }

  scheduling_policy {
    preemptible = var.instance_preemptible
  }

}

resource "yandex_compute_instance" "instance-worker" {

  allow_stopping_for_update = true
  count                     = var.workers

  name      = "swarm-worker-${count.index + 1}"
  hostname  = "swarm-worker-${count.index + 1}"
  folder_id = var.folder_id
  zone      = var.zone

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.disk
    }
  }

  network_interface {
    subnet_id      = var.subnet_id
    ipv4           = var.ipv4
    ipv6           = var.ipv6
    nat            = var.nat
  }

  metadata = {
    user-data = "${file(var.user_data)}"
  }

  scheduling_policy {
    preemptible = var.instance_preemptible
  }

}
