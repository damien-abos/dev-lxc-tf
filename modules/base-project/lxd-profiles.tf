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

  depends_on = [lxd_project.project]
}

resource "lxd_profile" "micro" {
  project = lxd_project.project.name
  name    = "micro"
  description = "1 vCPU / 1 GiB Mem / 8 GiB Disk"

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

  depends_on = [lxd_project.project]
}

resource "lxd_profile" "small" {
  project = lxd_project.project.name
  name    = "small"
  description = "1 vCPU / 2 GiB Mem / 8 GiB Disk"

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

  depends_on = [lxd_project.project]
}

resource "lxd_profile" "medium" {
  project = lxd_project.project.name
  name    = "medium"
  description = "2 vCPU / 4 GiB Mem / 10 GiB Disk"

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

  depends_on = [lxd_project.project]
}

resource "lxd_profile" "large" {
  project = lxd_project.project.name
  name    = "large"
  description = "2 vCPU / 8 GiB Mem / 20 GiB Disk"

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

  depends_on = [lxd_project.project]
}

resource "lxd_profile" "xlarge" {
  project = lxd_project.project.name
  name    = "xlarge"
  description = "4 vCPU / 12 GiB Mem / 40 GiB Disk"

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

  depends_on = [lxd_project.project]
}