resource "azurerm_monitor_diagnostic_setting" "dbk_diag" {
  count                      = var.resource_type == "dbk" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "dbk_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "RemoteHistoryService"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "accounts"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "clusters"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "databrickssql"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "dbfs"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "deltaPipelines"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "featureStore"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "genie"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "globalInitScripts"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "iamRole"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "instancePools"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "jobs"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "mlflowAcledArtifact"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "mlflowExperiment"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "modelRegistry"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "notebook"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "repos"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "secrets"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "sqlPermissions"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "sqlanalytics"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "ssh"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "unityCatalog"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "workspace"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "gitCredentials"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "webTerminal"

    retention_policy {
      days    = 365
      enabled = true
    }
  }
}