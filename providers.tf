terraform {
  required_version = ">= 1.6.0"

  required_providers {
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }

    lxd = {
      source  = "terraform-lxd/lxd"
      version = "2.2.0"
    }
  }
}

provider "lxd" {
}
