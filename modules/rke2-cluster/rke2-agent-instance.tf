data "template_file" "rke2-agent_cloudinit_config_users" {
  template = file("${path.module}/../cloud-init/_users.yaml")

  vars = {
    EXTRA_GROUPS = ""
  }
}

data "template_cloudinit_config" "rke2-agent" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "_users.yaml"
    content      = data.template_file.rke2-agent_cloudinit_config_users.rendered
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
    filename     = "rke2-agent.yaml"
    content      = file("${path.module}/cloud-init/rke2-agent.yaml")
    content_type = "text/cloud-config"
    merge_type   = local.merge_type
  }
}

resource "lxd_instance" "rke2-agent" {
  count            = var.rke2-cluster_agent_count
  name             = "${var.rke2-cluster_name}-rke2-agent-${count.index}"
  image            = var.rke2-cluster_image
  type             = var.rke2-cluster_type
  profiles         = var.rke2-cluster_profiles
  project          = var.rke2-cluster_project_name
  wait_for_network = true
  start_on_create  = true
  ephemeral        = false

  config = {
    "user.user-data" = "${data.template_cloudinit_config.rke2-agent.rendered}"
  }

}
