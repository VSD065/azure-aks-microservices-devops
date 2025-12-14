output "log_analytics_id" {
  value = var.enable_log_analytics ? azurerm_log_analytics_workspace.this[0].id : null
}

