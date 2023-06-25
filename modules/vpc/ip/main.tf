terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.85"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_vpc_address" "addr" {
  name = var.addr_name
  external_ipv4_address {
    zone_id = var.zone
  }
}