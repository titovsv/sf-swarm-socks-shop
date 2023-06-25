variable "zone" {
  description = "Zone to create resources"
  type        = string
  default     = "ru-central1-a"
}

variable "folder_id" {
  description = "Folder id to create resources"
  type        = string
  default     = "b1gsm6pf678smcvm34fu"
}

variable "image_id" {
  description = "Instance OS image. Default is Debian 11"
  type        = string
  default     = "fd8oshj0osht8svg6rfs"
}