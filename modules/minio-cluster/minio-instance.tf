data "template_file" "minio-instance_cloudinit_config_users" {
  template = file("${path.module}/../cloud-init/_users.yaml")

  vars = {
    EXTRA_GROUPS = ", minio"
  }
}

data "template_cloudinit_config" "minio-instance" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "_users.yaml"
    content      = data.template_file.minio-instance_cloudinit_config_users.rendered
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
    filename     = "apt-source-minio.yaml"
    content      = file("${path.module}/cloud-init/apt-source-minio.yaml")
    content_type = "text/cloud-config"
    merge_type   = local.merge_type
  }

  part {
    filename     = "minio-instance.yaml"
    content      = file("${path.module}/cloud-init/minio-instance.yaml")
    content_type = "text/cloud-config"
    merge_type   = local.merge_type
  }
}

resource "lxd_instance" "minio-instance" {
  count            = var.minio-instance_count
  name             = "${var.minio-instance_name}-${count.index}"
  image            = var.minio-instance_image
  type             = var.minio-instance_type
  profiles         = var.minio-instance_profiles
  project          = var.minio-instance_project_name
  wait_for_network = true
  running  = true
  ephemeral        = false
  config = {
    "user.user-data" = "${data.template_cloudinit_config.minio-instance.rendered}"
  }
}