# Blob storage logging

resource "azurerm_monitor_diagnostic_setting" "sa_blob_diag" {
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

# SA storage logging
resource "azurerm_monitor_diagnostic_setting" "sa_diag" {
  count                      = var.resource_type == "sa" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "storage_securityLogs"
  target_resource_id         = var.resource_id

  metric {
    category = "Transaction"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
}

# Queue Logging
resource "azurerm_monitor_diagnostic_setting" "sa_queue_diag" {
  count                      = var.resource_type == "sa" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "storage_securityLogs"
  target_resource_id         = "${var.resource_id}/queueServices/default/"

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

# Table Logging

resource "azurerm_monitor_diagnostic_setting" "sa_table_diag" {
  count                      = var.resource_type == "sa" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "storage_securityLogs"
  target_resource_id         = "${var.resource_id}/tableServices/default"

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

# File Logging

resource "azurerm_monitor_diagnostic_setting" "file_table_diag" {
  count                      = var.resource_type == "sa" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "storage_securityLogs"
  target_resource_id         = "${var.resource_id}/fileServices/default"

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
