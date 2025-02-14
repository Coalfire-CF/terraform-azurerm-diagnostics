resource "azurerm_monitor_diagnostic_setting" "fw_diag" {
  count                      = var.resource_type == "fw" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "fw_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "AzureFirewallApplicationRule"
  }

  enabled_log {
    category = "AzureFirewallNetworkRule"
  }

  enabled_log {
    category = "AzureFirewallDnsProxy"
  }

  metric {
    category = "AllMetrics"
  }
}
