resource "lxd_profile" "nano" {
  project     = lxd_project.project.name
  name        = "nano"
  description = "1 vCPU / 0.5 GiB Mem / 8 GiB Disk"

  config = {
    "limits.cpu"    = 1
    "limits.memory" = "512MiB"
  }

  device {
    name = "eth0"
    type = "nic"

    properties = {
      network = var.lxd_network_name
    }
  }

  device {
    type = "disk"
    name = "root"

    properties = {
      pool = var.lxd_storage_pool_name
      path = "/"
      size = "8GB"
    }
  }
}

resource "lxd_profile" "micro" {
  project = lxd_project.project.name
  name    = "micro"

  config = {
    "limits.cpu"    = 1
    "limits.memory" = "1GiB"
  }

  device {
    name = "eth0"
    type = "nic"

    properties = {
      network = var.lxd_network_name
    }
  }

  device {
    type = "disk"
    name = "root"

    properties = {
      pool = var.lxd_storage_pool_name
      path = "/"
      size = "8GB"
    }
  }
}

resource "lxd_profile" "small" {
  project = lxd_project.project.name
  name    = "small"

  config = {
    "limits.cpu"    = 1
    "limits.memory" = "2GiB"
  }

  device {
    name = "eth0"
    type = "nic"

    properties = {
      network = var.lxd_network_name
    }
  }

  device {
    type = "disk"
    name = "root"

    properties = {
      pool = var.lxd_storage_pool_name
      path = "/"
      size = "8GB"
    }
  }
}

resource "lxd_profile" "medium" {
  project = lxd_project.project.name
  name    = "medium"

  config = {
    "limits.cpu"    = 2
    "limits.memory" = "4GiB"
  }

  device {
    name = "eth0"
    type = "nic"

    properties = {
      network = var.lxd_network_name
    }
  }

  device {
    type = "disk"
    name = "root"

    properties = {
      pool = var.lxd_storage_pool_name
      path = "/"
      size = "10GB"
    }
  }
}

resource "lxd_profile" "large" {
  project = lxd_project.project.name
  name    = "large"

  config = {
    "limits.cpu"    = 2
    "limits.memory" = "8GiB"
  }

  device {
    name = "eth0"
    type = "nic"

    properties = {
      network = var.lxd_network_name
    }
  }

  device {
    type = "disk"
    name = "root"

    properties = {
      pool = var.lxd_storage_pool_name
      path = "/"
      size = "20GB"
    }
  }
}

resource "lxd_profile" "xlarge" {
  project = lxd_project.project.name
  name    = "xlarge"

  config = {
    "limits.cpu"    = 4
    "limits.memory" = "12GiB"
  }

  device {
    name = "eth0"
    type = "nic"

    properties = {
      network = var.lxd_network_name
    }
  }

  device {
    type = "disk"
    name = "root"

    properties = {
      pool = var.lxd_storage_pool_name
      path = "/"
      size = "40GB"
    }
  }
}