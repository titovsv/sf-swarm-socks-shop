terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.85"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = var.subnet_name
  zone           = var.subnet_zone
  folder_id      = var.folder_id
  network_id     = var.network_id
  v4_cidr_blocks = var.v4_cidr_blocks
  route_table_id = var.route_table_id
}