resource "azurerm_monitor_diagnostic_setting" "aks_diag" {
  count                      = var.resource_type == "aks" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "aks_securityLogs"
  target_resource_id         = var.resource_id

  log {
    category = "cloud-controller-manager"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  log {
    category = "cluster-autoscaler"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  log {
    category = "csi-azuredisk-controller"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  log {
    category = "csi-azurefile-controller"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  log {
    category = "csi-snapshot-controller"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  log {
    category = "guard"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  log {
    category = "kube-apiserver"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  log {
    category = "kube-audit"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  log {
    category = "kube-audit-admin"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  log {
    category = "kube-controller-manager"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  log {
    category = "kube-scheduler"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
}