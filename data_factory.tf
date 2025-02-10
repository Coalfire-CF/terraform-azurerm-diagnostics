resource "azurerm_monitor_diagnostic_setting" "df_diag" {
  count                      = var.resource_type == "df" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "df_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "ActivityRuns"
  }

  enabled_log {
    category = "PipelineRuns"
  }

  enabled_log {
    category = "SandboxActivityRuns"
  }

  enabled_log {
    category = "SandboxPipelineRuns"
  }

  enabled_log {
    category = "SSISIntegrationRuntimeLogs"
  }

  enabled_log {
    category = "SSISPackageEventMessageContext"
  }

  enabled_log {
    category = "SSISPackageEventMessages"
  }

  enabled_log {
    category = "SSISPackageExecutableStatistics"
  }

  enabled_log {
    category = "SSISPackageExecutionComponentPhases"
  }

  enabled_log {
    category = "SSISPackageExecutionDataStatistics"
  }

  enabled_log {
    category = "TriggerRuns"
  }
}
