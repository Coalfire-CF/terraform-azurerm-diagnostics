resource "azurerm_monitor_diagnostic_setting" "df_diag" {
  count                      = var.resource_type == "df" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "df_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "ActivityRuns"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "PipelineRuns"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "SandboxActivityRuns"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "SandboxPipelineRuns"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "SSISIntegrationRuntimeLogs"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "SSISPackageEventMessageContext"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "SSISPackageEventMessages"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "SSISPackageExecutableStatistics"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "SSISPackageExecutionComponentPhases"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "SSISPackageExecutionDataStatistics"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "TriggerRuns"

    retention_policy {
      days    = 365
      enabled = true
    }
  }
}