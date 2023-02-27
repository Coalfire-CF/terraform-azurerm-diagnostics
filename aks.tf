resource "azurerm_monitor_diagnostic_setting" "aks_diag" {
  count                      = var.resource_type == "aks" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "aks_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "cloud-controller-manager"

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "cluster-autoscaler"

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "csi-azuredisk-controller"

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "csi-azurefile-controller"

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "csi-snapshot-controller"

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "guard"

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "kube-apiserver"

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "kube-audit"

    retention_policy {
      enabled = true
      days    = 365
    }
  }
  enabled_log {
    category = "kube-audit-admin"

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "kube-controller-manager"

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "kube-scheduler"

    retention_policy {
      days    = 365
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = false

    retention_policy {
      days    = 365
      enabled = true
    }
  }
}
