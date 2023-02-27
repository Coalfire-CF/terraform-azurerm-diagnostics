resource "azurerm_monitor_diagnostic_setting" "sa_diag" {
  count                      = var.resource_type == "sa" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "storage_securityLogs"
  target_resource_id         = "${var.resource_id}/blobServices/default"

  enabled_log {
    category = "StorageDelete"


    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "StorageRead"


    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "StorageWrite"


    retention_policy {
      days    = 365
      enabled = true
    }
  }

  metric {
    category = "Capacity"


    retention_policy {
      days    = 365
      enabled = false
    }
  }
  metric {
    category = "Transaction"
    enabled  = false

    retention_policy {
      days    = 365
      enabled = true
    }
  }
}
