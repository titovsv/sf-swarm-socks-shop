variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "subnet_zone" {
  description = "Zone to create subnet"
  type        = string
}

variable "folder_id" {
  description = "Folder id to create subnet"
  type        = string
}

variable "v4_cidr_blocks" {
  description = "Subnet cidr blocks"
  type        = list(any)
}


variable "route_table_id" {
  description = "Route table to attach subnet"
  type        = string
}

variable "network_id" {
  description = "ID network to create subnet"
  type        = string
}