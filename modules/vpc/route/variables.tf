variable "rt_name" {
  description = "Route table name"
  type        = string
}

variable "folder_id" {
  description = "Folder id to create resources"
  type        = string
}

variable "network_id" {
  description = "Network id to link route table"
  type        = string
}

variable "nat_gateway_id" {
  description = "Gateway id for static route"
  type        = string
}