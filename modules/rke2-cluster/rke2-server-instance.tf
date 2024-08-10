data "template_file" "rke2-server_cloudinit_config_users" {
  template = file("${path.module}/../cloud-init/_users.yaml")

  vars = {
    EXTRA_GROUPS = ""
  }
}

data "template_cloudinit_config" "rke2-server" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "_users.yaml"
    content      = data.template_file.rke2-server_cloudinit_config_users.rendered
    content_type = "text/cloud-config"
    merge_type   = local.merge_type
  }

  part {
    filename     = "_packages.yaml"
    content      = file("${path.module}/../cloud-init/_packages.yaml")
    content_type = "text/cloud-config"
    merge_type   = local.merge_type
  }

  part {
    filename     = "rke2-server.yaml"
    content      = file("${path.module}/cloud-init/rke2-server.yaml")
    content_type = "text/cloud-config"
    merge_type   = local.merge_type
  }
}

resource "lxd_instance" "rke2-server" {
  count            = var.rke2-cluster_server_count
  name             = "${var.rke2-cluster_name}-rke2-server-${count.index}"
  image            = var.rke2-cluster_image
  type             = var.rke2-cluster_type
  profiles         = var.rke2-cluster_profiles
  project          = var.rke2-cluster_project_name
  wait_for_network = true
  running  = true
  ephemeral        = false

  config = {
    "user.user-data" = "${data.template_cloudinit_config.rke2-server.rendered}"
  }

}
