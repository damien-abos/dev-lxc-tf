variable "lxd_project_name" {
  type    = string
  default = "homelab"
}

variable "lxd_project_desc" {
  type    = string
  default = ""
}

variable "lxd_image_name" {
  type    = string
  default = "debian/12/cloud"
}

variable "lxd_network_name" {
  type    = string
  default = "lxdbr0"
}

variable "lxd_storage_pool_name" {
  type    = string
  default = "default"
}