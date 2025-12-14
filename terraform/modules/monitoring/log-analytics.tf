resource "azurerm_log_analytics_workspace" "law" {
  name                = "${var.name_prefix}-law"
  location            = var.location
  resource_group_name = "${var.name_prefix}-rg"
  sku                 = "PerGB2018"
}

