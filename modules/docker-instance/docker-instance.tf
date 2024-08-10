data "template_file" "docker-instance_cloudinit_config_users" {
  template = file("${path.module}/../cloud-init/_users.yaml")

  vars = {
    EXTRA_GROUPS = ", docker"
  }
}

data "template_cloudinit_config" "docker-instance" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "_users.yaml"
    content      = data.template_file.docker-instance_cloudinit_config_users.rendered
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
    filename     = "apt-source-docker.yaml"
    content      = file("${path.module}/cloud-init/apt-source-docker.yaml")
    content_type = "text/cloud-config"
    merge_type   = local.merge_type
  }

  part {
    filename     = "docker-instance.yaml"
    content      = file("${path.module}/cloud-init/docker-instance.yaml")
    content_type = "text/cloud-config"
    merge_type   = local.merge_type
  }
}

resource "lxd_instance" "docker-instance" {
  count            = var.docker-instance_count
  name             = "${var.docker-instance_name}-${count.index}"
  image            = var.docker-instance_image
  type             = var.docker-instance_type
  profiles         = var.docker-instance_profiles
  project          = var.docker-instance_project_name
  wait_for_network = true
  running  = true
  ephemeral        = false
  config = {
    "user.user-data" = "${data.template_cloudinit_config.docker-instance.rendered}"
  }
}