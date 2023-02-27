# You need to create separate diagnostic settings for Azure Backup and Azure Site Recovery events to prevent potential data loss. 
# For Azure Backup events, if you choose the 'Resource specific' mode, 
# you must select the following events only - CoreAzureBackup, AddonAzureBackupJobs, AddonAzureBackupAlerts, AddonAzureBackupPolicy, AddonAzureBackupStorage, AddonAzureBackupProtectedInstance. 
# The AzureBackupReport event works only in 'Azure diagnostics' mode

resource "azurerm_monitor_diagnostic_setting" "rsv_backup_diag" {
  count                          = var.resource_type == "rsv" ? 1 : 0
  log_analytics_workspace_id     = var.diag_log_analytics_id
  name                           = "backup_securityLogs"
  target_resource_id             = var.resource_id
  log_analytics_destination_type = "Dedicated"

  enabled_log {
    category = "AddonAzureBackupAlerts"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "AddonAzureBackupJobs"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "AddonAzureBackupPolicy"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "AddonAzureBackupProtectedInstance"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "AddonAzureBackupStorage"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "AzureBackupReport"
    enabled  = false #Due to issue above

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "AzureSiteRecoveryEvents"
    enabled  = false #Due to issue above

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "AzureSiteRecoveryJobs"
    enabled  = false #Due to issue above

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "AzureSiteRecoveryProtectedDiskDataChurn"
    enabled  = false #Due to issue above

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "AzureSiteRecoveryRecoveryPoints"
    enabled  = false #Due to issue above

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "AzureSiteRecoveryReplicatedItems"
    enabled  = false #Due to issue above

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "AzureSiteRecoveryReplicationDataUploadRate"
    enabled  = false #Due to issue above

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "AzureSiteRecoveryReplicationStats"
    enabled  = false #Due to issue above

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "CoreAzureBackup"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "rsv_site_recovery_diag" {
  count                      = var.resource_type == "rsv" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "site_recovery_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "AddonAzureBackupAlerts"
    enabled  = false #Due to issue above

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "AddonAzureBackupJobs"
    enabled  = false #Due to issue above

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "AddonAzureBackupPolicy"
    enabled  = false #Due to issue above

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "AddonAzureBackupProtectedInstance"
    enabled  = false #Due to issue above

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "AddonAzureBackupStorage"
    enabled  = false #Due to issue above

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "AzureBackupReport"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "AzureSiteRecoveryEvents"
    enabled  = true
    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "AzureSiteRecoveryJobs"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "AzureSiteRecoveryProtectedDiskDataChurn"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "AzureSiteRecoveryRecoveryPoints"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "AzureSiteRecoveryReplicatedItems"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "AzureSiteRecoveryReplicationDataUploadRate"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "AzureSiteRecoveryReplicationStats"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "CoreAzureBackup"
    enabled  = false #Due to issue above

    retention_policy {
      days    = 365
      enabled = false
    }
  }

  depends_on = [
    azurerm_monitor_diagnostic_setting.rsv_backup_diag
  ]
}
