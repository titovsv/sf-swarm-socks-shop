terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.85"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = "C:\\Terraform\\authorized_key.json"
}

module "network" {
  source       = "./modules/vpc/network"
  network_name = "network"
  folder_id    = var.folder_id
}

module "gateway" {
  source           = "./modules/vpc/gateway"
  nat_gateway_name = "gateway"
  folder_id        = var.folder_id
}

module "route" {
  source         = "./modules/vpc/route"
  folder_id      = var.folder_id
  rt_name        = "route-table"
  nat_gateway_id = module.gateway.gw_id
  network_id     = module.network.network_id
}

module "subnet_01" {
  source         = "./modules/vpc/subnet"
  subnet_name    = "subnet-01"
  subnet_zone    = "ru-central1-a"
  folder_id      = var.folder_id
  network_id     = module.network.network_id
  v4_cidr_blocks = ["192.168.24.0/24"]
  route_table_id = module.route.rt_id
}

# ####################################################
# ################### Instances ######################
# ####################################################

module "swarm_cluster" {
  source               = "./modules/instance"
  folder_id            = var.folder_id
  zone                 = "ru-central1-a"
  cores                = 2
  memory               = 2
  disk                 = 15
  ipv4                 = true
  ipv6                 = false
  subnet_id            = module.subnet_01.subnet_id
  user_data            = "./meta.yml"
  image_id             = var.image_id
  instance_preemptible = true
  nat                  = true
  managers             = 1
  workers              = 1
}
