resource "azurerm_monitor_diagnostic_setting" "nsg_diag" {
  count                      = var.resource_type == "nsg" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "nsg_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "NetworkSecurityGroupEvent"
  }
  enabled_log {
    category = "NetworkSecurityGroupRuleCounter"
  }
}
