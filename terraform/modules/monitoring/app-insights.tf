resource "azurerm_application_insights" "appi" {
  name                = "${var.name_prefix}-appi"
  location            = var.location
  resource_group_name = "${var.name_prefix}-rg"
  application_type    = "web"
}

