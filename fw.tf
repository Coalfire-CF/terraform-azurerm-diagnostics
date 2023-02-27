resource "azurerm_monitor_diagnostic_setting" "fw_diag" {
  count                      = var.resource_type == "fw" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "fw_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "AzureFirewallApplicationRule"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "AzureFirewallNetworkRule"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "AzureFirewallDnsProxy"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
}
