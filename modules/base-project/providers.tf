terraform {
  required_providers {
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }

    lxd = {
      source  = "terraform-lxd/lxd"
      version = "1.10.2"
    }
  }
}
