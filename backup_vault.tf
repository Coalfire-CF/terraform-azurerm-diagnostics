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
  }
  enabled_log {
    category = "AddonAzureBackupJobs"
  }
  enabled_log {
    category = "AddonAzureBackupPolicy"
  }
  enabled_log {
    category = "AddonAzureBackupProtectedInstance"
  }
  enabled_log {
    category = "AddonAzureBackupStorage"
  }
  enabled_log {
    category = "AzureBackupReport"
  }
  enabled_log {
    category = "AzureSiteRecoveryEvents"
  }
  enabled_log {
    category = "AzureSiteRecoveryJobs"
  }
  enabled_log {
    category = "AzureSiteRecoveryProtectedDiskDataChurn"
  }
  enabled_log {
    category = "AzureSiteRecoveryRecoveryPoints"
  }
  enabled_log {
    category = "AzureSiteRecoveryReplicatedItems"
  }
  enabled_log {
    category = "AzureSiteRecoveryReplicationDataUploadRate"
  }
  enabled_log {
    category = "AzureSiteRecoveryReplicationStats"
  }
  enabled_log {
    category = "CoreAzureBackup"
  }
}

resource "azurerm_monitor_diagnostic_setting" "rsv_site_recovery_diag" {
  count                      = var.resource_type == "rsv" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "site_recovery_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "AddonAzureBackupAlerts"
  }
  enabled_log {
    category = "AddonAzureBackupJobs"
  }
  enabled_log {
    category = "AddonAzureBackupPolicy"
  }
  enabled_log {
    category = "AddonAzureBackupProtectedInstance"
  }
  enabled_log {
    category = "AddonAzureBackupStorage"
  }
  enabled_log {
    category = "AzureBackupReport"
  }
  enabled_log {
    category = "AzureSiteRecoveryEvents"
  }
  enabled_log {
    category = "AzureSiteRecoveryJobs"
  }
  enabled_log {
    category = "AzureSiteRecoveryProtectedDiskDataChurn"
  }
  enabled_log {
    category = "AzureSiteRecoveryRecoveryPoints"
  }
  enabled_log {
    category = "AzureSiteRecoveryReplicatedItems"
  }
  enabled_log {
    category = "AzureSiteRecoveryReplicationDataUploadRate"
  }
  enabled_log {
    category = "AzureSiteRecoveryReplicationStats"
  }
  enabled_log {
    category = "CoreAzureBackup"
  }

  depends_on = [
    azurerm_monitor_diagnostic_setting.rsv_backup_diag
  ]
}
