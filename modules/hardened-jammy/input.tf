locals {
  merge_type = "list(append)+dict(no_replace,recurse_list)+str()"
}

variable "hardened-jammy-instance_name" {
  type    = string
  default = "hardened-jammy-instance"
}

variable "hardened-jammy-instance_type" {
  type    = string
  default = "virtual-machine"
}

variable "hardened-jammy-instance_profiles" {
  type    = list(string)
  default = ["micro"]
}

variable "hardened-jammy-instance_project_name" {
  type    = string
  default = "default"
}

variable "hardened-jammy-instance_image" {
  type    = string
  default = "images:jammy"
}

variable "hardened-jammy-instance_count" {
  type    = number
  default = 0
}