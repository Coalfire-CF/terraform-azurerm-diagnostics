resource "azurerm_monitor_diagnostic_setting" "dbk_diag" {
  count                      = var.resource_type == "dbk" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "dbk_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "RemoteHistoryService"
  }

  enabled_log {
    category = "accounts"
  }

  enabled_log {
    category = "clusters"
  }

  enabled_log {
    category = "databrickssql"
  }

  enabled_log {
    category = "dbfs"
  }

  enabled_log {
    category = "deltaPipelines"
  }

  enabled_log {
    category = "featureStore"
  }

  enabled_log {
    category = "genie"
  }

  enabled_log {
    category = "globalInitScripts"
  }

  enabled_log {
    category = "iamRole"
  }

  enabled_log {
    category = "instancePools"
  }

  enabled_log {
    category = "jobs"
  }

  enabled_log {
    category = "mlflowAcledArtifact"
  }

  enabled_log {
    category = "mlflowExperiment"
  }

  enabled_log {
    category = "modelRegistry"
  }

  enabled_log {
    category = "notebook"
  }

  enabled_log {
    category = "repos"
  }

  enabled_log {
    category = "secrets"
  }

  enabled_log {
    category = "sqlPermissions"
  }

  enabled_log {
    category = "sqlanalytics"
  }

  enabled_log {
    category = "ssh"
  }

  enabled_log {
    category = "unityCatalog"
  }

  enabled_log {
    category = "workspace"
  }

  enabled_log {
    category = "gitCredentials"
  }

  enabled_log {
    category = "webTerminal"
  }
}
