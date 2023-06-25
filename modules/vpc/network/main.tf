terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.85"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_vpc_network" "network" {
  name      = var.network_name
  folder_id = var.folder_id
}