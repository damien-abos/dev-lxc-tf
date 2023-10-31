locals {
  merge_type = "list(append)+dict(no_replace,recurse_list)+str()"
}

variable "haproxy-instance_name" {
  type    = string
  default = "haproxy-instance"
}

variable "haproxy-instance_type" {
  type    = string
  default = "virtual-machine"
}

variable "haproxy-instance_profiles" {
  type    = list(string)
  default = ["micro"]
}

variable "haproxy-instance_project_name" {
  type    = string
  default = "default"
}

variable "haproxy-instance_image" {
  type    = string
  default = "images:base-vm"
}

variable "haproxy-instance_count" {
  type    = number
  default = 0
}