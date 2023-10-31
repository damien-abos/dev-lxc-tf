variable "lxd_project_name" {
  type    = string
  default = "homelab"
}

variable "lxd_project_desc" {
  type    = string
  default = ""
}

variable "lxd_storage_pool_name" {
  type    = string
  default = "default"
}

variable "lxd_network_name" {
  type    = string
  default = "lxdbr0"
}

variable "lxd_image_name" {
  type    = string
  default = "debian/12/cloud"
}

variable "docker-instance_count" {
  type    = number
  default = 0
}

variable "rke2-cluster_server_count" {
  type    = number
  default = 0
}

variable "rke2-cluster_agent_count" {
  type    = number
  default = 0
}

variable "haproxy-instance_count" {
  type    = number
  default = 0
}