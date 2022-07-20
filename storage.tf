resource "azurerm_monitor_diagnostic_setting" "sa_diag" {
  count                      = var.resource_type == "sa" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "storage_securityLogs"
  target_resource_id         = "${var.resource_id}/blobServices/default"

  log {
    category = "StorageDelete"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  log {
    category = "StorageRead"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  log {
    category = "StorageWrite"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  metric {
    category = "Capacity"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  metric {
    category = "Transaction"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
}