resource "azurerm_monitor_diagnostic_setting" "aks_diag" {
  count                      = var.resource_type == "aks" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "aks_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "cloud-controller-manager"
  }
  enabled_log {
    category = "cluster-autoscaler"
  }
  enabled_log {
    category = "csi-azuredisk-controller"
  }
  enabled_log {
    category = "csi-azurefile-controller"
  }
  enabled_log {
    category = "csi-snapshot-controller"
  }
  enabled_log {
    category = "guard"
  }
  enabled_log {
    category = "kube-apiserver"
  }
  enabled_log {
    category = "kube-audit"
  }
  enabled_log {
    category = "kube-audit-admin"
  }
  enabled_log {
    category = "kube-controller-manager"
  }
  enabled_log {
    category = "kube-scheduler"
  }

}
