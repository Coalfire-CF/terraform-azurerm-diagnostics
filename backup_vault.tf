# You need to create separate diagnostic settings for Azure Backup and Azure Site Recovery events to prevent potential data loss. 
# For Azure Backup events, if you choose the 'Resource specific' mode, 
# you must select the following events only - CoreAzureBackup, AddonAzureBackupJobs, AddonAzureBackupAlerts, AddonAzureBackupPolicy, AddonAzureBackupStorage, AddonAzureBackupProtectedInstance. 
# The AzureBackupReport event works only in 'Azure diagnostics' mode

resource "azurerm_monitor_diagnostic_setting" "rsv_backup_diag" {
  count                          = var.resource_type == "rsv" ? 1 : 0
  log_analytics_workspace_id     = var.diag_log_analytics_id
  name                           = "backup_diagnosticLogs"
  target_resource_id             = var.resource_id
  log_analytics_destination_type = "Dedicated"

  log {
    category = "AddonAzureBackupAlerts"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AddonAzureBackupJobs"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AddonAzureBackupPolicy"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AddonAzureBackupProtectedInstance"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AddonAzureBackupStorage"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AzureBackupReport"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AzureSiteRecoveryEvents"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AzureSiteRecoveryJobs"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AzureSiteRecoveryProtectedDiskDataChurn"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AzureSiteRecoveryRecoveryPoints"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AzureSiteRecoveryReplicatedItems"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AzureSiteRecoveryReplicationDataUploadRate"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AzureSiteRecoveryReplicationStats"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "CoreAzureBackup"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "rsv_site_recovery_diag" {
  count                      = var.resource_type == "rsv" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "site_recovery_diagnosticLogs"
  target_resource_id         = var.resource_id

  log {
    category = "AddonAzureBackupAlerts"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AddonAzureBackupJobs"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AddonAzureBackupPolicy"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AddonAzureBackupProtectedInstance"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AddonAzureBackupStorage"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AzureBackupReport"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AzureSiteRecoveryEvents"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AzureSiteRecoveryJobs"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AzureSiteRecoveryProtectedDiskDataChurn"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AzureSiteRecoveryRecoveryPoints"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AzureSiteRecoveryReplicatedItems"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AzureSiteRecoveryReplicationDataUploadRate"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AzureSiteRecoveryReplicationStats"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "CoreAzureBackup"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  depends_on = [
    azurerm_monitor_diagnostic_setting.rsv_backup_diag
  ]
}
