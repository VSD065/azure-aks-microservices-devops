resource "azurerm_log_analytics_workspace" "this" {
  count               = var.enable_log_analytics ? 1 : 0
  name                = "${var.name_prefix}-law"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

