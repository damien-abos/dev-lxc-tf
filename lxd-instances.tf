data "template_cloudinit_config" "dev-001" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "${path.module}/cloud-init/_users.yaml"
    content      = file("${path.module}/cloud-init/_users.yaml")
    content_type = "text/cloud-config"
  }

  part {
    filename     = "${path.module}/cloud-init/_apt-source-docker.yaml"
    content      = file("${path.module}/cloud-init/_apt-source-docker.yaml")
    content_type = "text/cloud-config"
  }

  part {
    filename     = "${path.module}/cloud-init/_packages.yaml"
    content      = file("${path.module}/cloud-init/_packages.yaml")
    content_type = "text/cloud-config"
  }

  part {
    filename     = "${path.module}/cloud-init/dev-001.yaml"
    content      = file("${path.module}/cloud-init/dev-001.yaml")
    content_type = "text/cloud-config"
  }
}

resource "lxd_instance" "dev-001" {
  name     = "dev-001"
  image    = "images:debian/12/cloud"
  type     = "virtual-machine"
  profiles = ["large"]
  project  = lxd_project.project.name
  config = {
    "user.user-data" = "${data.template_cloudinit_config.dev-001.rendered}"
  }
}

data "template_cloudinit_config" "k8s-001-rke2-server-001" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "${path.module}/cloud-init/_users.yaml"
    content      = file("${path.module}/cloud-init/_users.yaml")
    content_type = "text/cloud-config"
  }

  part {
    filename     = "${path.module}/cloud-init/_apt-source-docker.yaml"
    content      = file("${path.module}/cloud-init/_apt-source-docker.yaml")
    content_type = "text/cloud-config"
  }

  part {
    filename     = "${path.module}/cloud-init/_packages.yaml"
    content      = file("${path.module}/cloud-init/_packages.yaml")
    content_type = "text/cloud-config"
  }

  part {
    filename     = "${path.module}/cloud-init/k8s-001-rke2-server-001.yaml"
    content      = file("${path.module}/cloud-init/k8s-001-rke2-server-001.yaml")
    content_type = "text/cloud-config"
  }
}

resource "lxd_instance" "k8s-001-rke2-server-001" {
  name     = "k8s-001-rke2-server-001"
  image    = "images:debian/12/cloud"
  type     = "virtual-machine"
  profiles = ["large"]
  project  = lxd_project.project.name
  config = {
    "user.user-data" = "${data.template_cloudinit_config.k8s-001-rke2-server-001.rendered}"
  }
}

data "template_cloudinit_config" "k8s-001-rke2-agent-001" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "${path.module}/cloud-init/_users.yaml"
    content      = file("${path.module}/cloud-init/_users.yaml")
    content_type = "text/cloud-config"
  }

  part {
    filename     = "${path.module}/cloud-init/_apt-source-docker.yaml"
    content      = file("${path.module}/cloud-init/_apt-source-docker.yaml")
    content_type = "text/cloud-config"
  }

  part {
    filename     = "${path.module}/cloud-init/_packages.yaml"
    content      = file("${path.module}/cloud-init/_packages.yaml")
    content_type = "text/cloud-config"
  }

  part {
    filename     = "${path.module}/cloud-init/k8s-001-rke2-agent-001.yaml"
    content      = file("${path.module}/cloud-init/k8s-001-rke2-agent-001.yaml")
    content_type = "text/cloud-config"
  }
}

resource "lxd_instance" "k8s-001-rke2-agent-001" {
  name     = "k8s-001-rke2-agent-001"
  image    = "images:debian/12/cloud"
  type     = "virtual-machine"
  profiles = ["large"]
  project  = lxd_project.project.name
  config = {
    "user.user-data" = "${data.template_cloudinit_config.k8s-001-rke2-agent-001.rendered}"
  }
}