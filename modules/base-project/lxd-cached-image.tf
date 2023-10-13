resource "lxd_cached_image" "base-vm" {
  source_remote = "images"
  source_image  = var.lxd_image_name
  type          = "virtual-machine"
  project       = lxd_project.project.name
  aliases       = ["base-vm"]

  depends_on = [lxd_project.project]
}

resource "lxd_cached_image" "base-container" {
  source_remote = "images"
  source_image  = var.lxd_image_name
  type          = "container"
  project       = lxd_project.project.name
  aliases       = ["base-container"]

  depends_on = [lxd_project.project]
}