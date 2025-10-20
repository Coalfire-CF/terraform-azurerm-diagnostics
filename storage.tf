# Blob storage logging

resource "azurerm_monitor_diagnostic_setting" "sa_blob_diag" {
  count                      = var.resource_type == "sa" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "storage_securityLogs"
  target_resource_id         = "${var.resource_id}/blobServices/default"

  enabled_log {
    category = "StorageDelete"
  }
  enabled_log {
    category = "StorageRead"
  }
  enabled_log {
    category = "StorageWrite"
  }

  metric {
    category = "Capacity"
  }
  metric {
    category = "Transaction"
    enabled  = false
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
  }

  metric {
    category = "Capacity"
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
  }
  enabled_log {
    category = "StorageRead"
  }
  enabled_log {
    category = "StorageWrite"
  }

  metric {
    category = "Capacity"
  }
  metric {
    category = "Transaction"
    enabled  = false
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
  }
  enabled_log {
    category = "StorageRead"
  }
  enabled_log {
    category = "StorageWrite"
  }

  metric {
    category = "Capacity"
  }
  metric {
    category = "Transaction"
    enabled  = false
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
  }
  enabled_log {
    category = "StorageRead"
  }
  enabled_log {
    category = "StorageWrite"
  }

  enabled_metric {
    category = "Capacity"
  }

  enabled_metric {
    category = "Transaction"
  }
}
