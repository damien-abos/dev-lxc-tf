resource "lxd_cached_image" "bookworm-vm" {
  source_remote = "images"
  source_image  = var.lxd_image_name
  type          = "virtual-machine"
  project       = lxd_project.project.name
  aliases       = ["bookworm-vm"]
}
