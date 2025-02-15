module "base-project" {
  source = "./modules/base-project"

  lxd_project_name      = var.lxd_project_name
  lxd_project_desc      = var.lxd_project_desc
  lxd_image_name        = var.lxd_image_name
  lxd_network_name      = var.lxd_network_name
  lxd_storage_pool_name = var.lxd_storage_pool_name
}

module "docker-dev-001" {
  source = "./modules/docker-instance"

  docker-instance_name         = "docker"
  docker-instance_project_name = module.base-project.lxd_project.name
  docker-instance_image        = "images:${module.base-project.lxd_cached_image_base-vm.fingerprint}"
  docker-instance_type         = "virtual-machine"
  docker-instance_profiles     = ["large"]
  docker-instance_count        = var.docker-instance_count

  depends_on = [module.base-project]
}

module "haproxy" {
  source = "./modules/haproxy"

  haproxy-instance_name         = "haproxy"
  haproxy-instance_project_name = module.base-project.lxd_project.name
  haproxy-instance_image        = "images:${module.base-project.lxd_cached_image_base-container.fingerprint}"
  haproxy-instance_type         = "container"
  haproxy-instance_profiles     = ["micro"]
  haproxy-instance_count        = var.haproxy-instance_count
}

module "rke2-cluster" {
  source = "./modules/rke2-cluster"

  rke2-cluster_name         = "k8s-001"
  rke2-cluster_project_name = module.base-project.lxd_project.name
  rke2-cluster_image        = "images:${module.base-project.lxd_cached_image_base-vm.fingerprint}"
  rke2-cluster_type         = "virtual-machine"
  rke2-cluster_profiles     = var.rke2-cluster-profiles
  rke2-cluster_server_count = var.rke2-cluster_server_count
  rke2-cluster_agent_count  = var.rke2-cluster_agent_count

  depends_on = [module.base-project]
}
