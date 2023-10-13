resource "lxd_project" "project" {
  name        = var.lxd_project_name
  description = var.lxd_project_desc
  config = {
    "features.images"          = "true"
    "features.profiles"        = "true"
    "features.storage.volumes" = "true"
  }
}