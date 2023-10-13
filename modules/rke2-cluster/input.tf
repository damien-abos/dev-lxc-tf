locals {
  merge_type = "list(append)+dict(no_replace,recurse_list)+str()"
}

variable "rke2-cluster_name" {
  type    = string
  default = "rke2-cluster"
}

variable "rke2-cluster_type" {
  type    = string
  default = "virtual-machine"
}

variable "rke2-cluster_profiles" {
  type    = list(string)
  default = ["large"]
}

variable "rke2-cluster_project_name" {
  type    = string
  default = "default"
}

variable "rke2-cluster_image" {
  type    = string
  default = "images:base-vm"
}

variable "rke2-cluster_server_count" {
  type    = number
  default = 0
}

variable "rke2-cluster_agent_count" {
  type    = number
  default = 0
}