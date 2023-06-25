output "manager_ip" {
  value = yandex_compute_instance.instance-manager[*].network_interface.0.nat_ip_address
}
output "worker_ip" {
  value = yandex_compute_instance.instance-worker[*].network_interface.0.nat_ip_address
}