resource "azurerm_kubernetes_cluster" "this" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.name_prefix}-aks"

  kubernetes_version = trimspace(var.kubernetes_version)

  default_node_pool {
  name           = "default"
  node_count     = var.node_count
  vm_size        = var.node_vm_size
  vnet_subnet_id = var.subnet_id

  upgrade_settings {
    max_surge = "1"
  }
}

  identity {
    type = "SystemAssigned"
  }

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_id
  }
}

