variable "image_id" {
  description = "OS family to get id image"
  type        = string
}

variable "folder_id" {
  description = "Folder id to create resources"
  type        = string
}

variable "zone" {
  description = "Zone to create resources"
  type        = string
}

variable "cores" {
  description = "Number of instance cores"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Instance RAM size in GB"
  type        = number
  default     = 2
}

variable "disk" {
  description = "Instance boot HDD size in GB"
  type        = number
  default     = 15
}

variable "ipv4" {
  description = "Use ipv4"
  type        = bool
  default     = true
}

variable "ipv6" {
  description = "Use ipv6"
  type        = bool
  default     = false
}

variable "nat" {
  description = "Use nat"
  type        = bool
  default     = false
}

variable "user_data" {
  description = "Path to YAML file with user data"
  type        = string
  default     = "./meta.yml"
}

variable "subnet_id" {
  description = "ID subnet to plug instance"
  type        = string
}

variable "managers" {
  description = "Count of manager nodes"
  type        = number
  default     = 1
}

variable "workers" {
  description = "Count of worker nodes"
  type        = number
  default     = 1
}

variable "instance_preemptible" {
  description = "Make instance preemptible"
  type        = bool
  default     = false
}

variable "ssh_credentials" {
  description = "Credentials for connect to instances"
  type        = object({
    user        = string
    private_key = string
    pub_key     = string
  })
  default     = {
    user        = "titov"
    private_key = "~/.ssh/id_rsa"
    pub_key     = "~/.ssh/id_rsa.pub"
  }
}