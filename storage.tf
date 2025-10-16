# Blob storage logging

resource "azurerm_monitor_diagnostic_setting" "sa_blob_diag" {
  count                      = var.resource_type == "sa" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "storage_blob_securityLogs"
  target_resource_id         = "${var.resource_id}/blobServices/default"

  log {
    category = "StorageDelete"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "StorageRead"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "StorageWrite"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  metric {
    category = "Capacity"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  metric {
    category = "Transaction"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }
}

# SA storage logging
resource "azurerm_monitor_diagnostic_setting" "sa_diag" {
  count                      = var.resource_type == "sa" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "storage_account_securityLogs"
  target_resource_id         = var.resource_id

  metric {
    category = "Transaction"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  metric {
    category = "Capacity"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }
}

# Queue Logging
resource "azurerm_monitor_diagnostic_setting" "sa_queue_diag" {
  count                      = var.resource_type == "sa" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "storage_queue_securityLogs"
  target_resource_id         = "${var.resource_id}/queueServices/default"

  log {
    category = "StorageDelete"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "StorageRead"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "StorageWrite"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  metric {
    category = "Capacity"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  metric {
    category = "Transaction"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }
}

# Table Logging

resource "azurerm_monitor_diagnostic_setting" "sa_table_diag" {
  count                      = var.resource_type == "sa" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "storage_table_securityLogs"
  target_resource_id         = "${var.resource_id}/tableServices/default"

  log {
    category = "StorageDelete"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "StorageRead"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "StorageWrite"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  metric {
    category = "Capacity"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  metric {
    category = "Transaction"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }
}

# File Logging
resource "azurerm_monitor_diagnostic_setting" "sa_file_diag" {
  count                      = var.resource_type == "sa" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "storage_file_securityLogs"
  target_resource_id         = "${var.resource_id}/fileServices/default"

  log {
    category = "StorageDelete"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "StorageRead"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "StorageWrite"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  metric {
    category = "Capacity"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  metric {
    category = "Transaction"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }
}
