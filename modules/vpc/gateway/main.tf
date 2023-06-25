terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.85"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_vpc_gateway" "nat_gateway" {
  name      = var.nat_gateway_name
  folder_id = var.folder_id
  shared_egress_gateway {}
}