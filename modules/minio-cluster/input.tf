locals {
  merge_type = "list(append)+dict(no_replace,recurse_list)+str()"
}

variable "minio-instance_name" {
  type    = string
  default = "minio-instance"
}

variable "minio-instance_type" {
  type    = string
  default = "virtual-machine"
}

variable "minio-instance_profiles" {
  type    = list(string)
  default = ["micro"]
}

variable "minio-instance_project_name" {
  type    = string
  default = "default"
}

variable "minio-instance_image" {
  type    = string
  default = "images:base-vm"
}

variable "minio-instance_count" {
  type    = number
  default = 0
}