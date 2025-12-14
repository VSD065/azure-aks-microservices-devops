resource "azurerm_resource_group" "this" {
  name     = "${var.name_prefix}-rg"
  location = var.location
}

module "network" {
  source               = "../../modules/network"
  location             = var.location
  name_prefix          = var.name_prefix
  vnet_cidr            = var.vnet_cidr
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidr  = var.private_subnet_cidr
}

module "acr" {
  source      = "../../modules/acr"
  location    = var.location
  name_prefix = var.name_prefix
  acr_name    = var.acr_name
}

module "monitoring" {
  source               = "../../modules/monitoring"
  location             = var.location
  name_prefix          = var.name_prefix
  resource_group_name  = azurerm_resource_group.this.name
  enable_log_analytics = var.enable_log_analytics
  enable_app_insights  = var.enable_app_insights
}


module "aks" {
  source = "../../modules/aks"

  location            = var.location
  name_prefix         = var.name_prefix
  resource_group_name = azurerm_resource_group.this.name

  aks_cluster_name   = var.aks_cluster_name
  kubernetes_version = var.kubernetes_version
  node_count         = var.aks_node_count
  node_vm_size       = var.aks_node_vm_size

  subnet_id        = module.network.private_subnet_id
  acr_id           = module.acr.acr_id
  log_analytics_id = module.monitoring.log_analytics_id
}


