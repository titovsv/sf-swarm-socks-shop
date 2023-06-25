terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.85"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_vpc_route_table" "rt" {
  name       = var.rt_name
  network_id = var.network_id
  folder_id  = var.folder_id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = var.nat_gateway_id
  }
}