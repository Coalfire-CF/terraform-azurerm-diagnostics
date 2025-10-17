resource "azurerm_monitor_diagnostic_setting" "aks_diag" {
  count                      = var.resource_type == "aks" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "aks_diagnosticLogs"
  target_resource_id         = var.resource_id

  # Logs
  for_each = toset([
    "cloud-controller-manager",
    "cluster-autoscaler",
    "csi-azuredisk-controller",
    "csi-azurefile-controller",
    "csi-snapshot-controller",
    "guard",
    "kube-apiserver",
    "kube-audit",
    "kube-audit-admin",
    "kube-controller-manager",
    "kube-scheduler"
  ])

  log {
    category = each.key
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
