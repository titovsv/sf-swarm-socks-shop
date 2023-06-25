output "gw_id" {
  description = "ID created gateway"
  value       = yandex_vpc_gateway.nat_gateway.id
}