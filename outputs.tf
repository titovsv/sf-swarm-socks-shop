output "manager_ip" {
  value = module.swarm_cluster[*].manager_ip
}

output "worker_ip" {
  value = module.swarm_cluster[*].worker_ip
}