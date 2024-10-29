resource "lxd_cached_image" "base-vm" {
  source_remote = "images"
  source_image  = "ubuntu-minimal:jammy"
  type          = "virtual-machine"
  project       = lxd_project.project.name
  aliases       = ["jammy"]

  depends_on = [lxd_project.project]
}

resource "lxd_cached_image" "base-container" {
  source_remote = "images"
  source_image  = "ubuntu-minimal:jammy"
  type          = "container"
  project       = lxd_project.project.name
  aliases       = ["jammy"]

  depends_on = [lxd_project.project]
}