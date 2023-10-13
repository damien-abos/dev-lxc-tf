locals {
  merge_type = "list(append)+dict(no_replace,recurse_list)+str()"
}

variable "docker-instance_name" {
  type    = string
  default = "docker-instance"
}

variable "docker-instance_type" {
  type    = string
  default = "virtual-machine"
}

variable "docker-instance_profiles" {
  type    = list(string)
  default = ["large"]
}

variable "docker-instance_project_name" {
  type    = string
  default = "default"
}

variable "docker-instance_image" {
  type    = string
  default = "images:base-vm"
}

variable "docker-instance_count" {
  type    = number
  default = 0
}