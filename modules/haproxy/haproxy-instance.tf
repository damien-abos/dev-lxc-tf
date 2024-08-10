data "template_file" "haproxy-instance_cloudinit_config_users" {
  template = file("${path.module}/../cloud-init/_users.yaml")

  vars = {
    EXTRA_GROUPS = ", haproxy"
  }
}

data "template_cloudinit_config" "haproxy-instance" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "_users.yaml"
    content      = data.template_file.haproxy-instance_cloudinit_config_users.rendered
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
    filename     = "apt-source-haproxy.yaml"
    content      = file("${path.module}/cloud-init/apt-source-haproxy.yaml")
    content_type = "text/cloud-config"
    merge_type   = local.merge_type
  }

  part {
    filename     = "haproxy-instance.yaml"
    content      = file("${path.module}/cloud-init/haproxy-instance.yaml")
    content_type = "text/cloud-config"
    merge_type   = local.merge_type
  }
}

resource "lxd_instance" "haproxy-instance" {
  count            = var.haproxy-instance_count
  name             = "${var.haproxy-instance_name}-${count.index}"
  image            = var.haproxy-instance_image
  type             = var.haproxy-instance_type
  profiles         = var.haproxy-instance_profiles
  project          = var.haproxy-instance_project_name
  wait_for_network = true
  running  = true
  ephemeral        = false
  config = {
    "user.user-data" = "${data.template_cloudinit_config.haproxy-instance.rendered}"
  }
}