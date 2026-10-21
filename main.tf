locals {
  # Types whose logs live on child resources get one setting per target.
  # Suffixes are appended to var.resource_id.
  child_targets = {
    sa = {
      sa       = ""
      sa_blob  = "/blobServices/default"
      sa_queue = "/queueServices/default"
      sa_table = "/tableServices/default"
      sa_file  = "/fileServices/default"
    }
    # Server auditing to Log Analytics needs SQLSecurityAuditEvents from master.
    mssql = {
      mssql        = ""
      mssql_master = "/databases/master"
    }
  }

  # "sub" uses the static Activity Log setting in subscription.tf.
  target_suffixes = var.resource_type == "sub" ? {} : lookup(local.child_targets, var.resource_type, { (var.resource_type) = "" })
  targets         = { for k, s in local.target_suffixes : k => "${var.resource_id}${s}" }

  # Unset types use the Azure default (AzureDiagnostics).
  destination_types = {
    rsv = "Dedicated"
    cdb = "AzureDiagnostics"
  }
}

data "azurerm_monitor_diagnostic_categories" "this" {
  for_each    = local.targets
  resource_id = each.value

  lifecycle {
    postcondition {
      condition     = length(self.log_category_types) + length(self.metrics) > 0
      error_message = "Azure returned no log or metric categories for diagnostics target \"${each.key}\" (${each.value}). Check resource_type and resource_id."
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  for_each                       = local.targets
  name                           = "${each.key}_securityLogs"
  target_resource_id             = each.value
  log_analytics_workspace_id     = var.diag_log_analytics_id
  log_analytics_destination_type = lookup(local.destination_types, var.resource_type, null)

  dynamic "enabled_log" {
    for_each = contains(data.azurerm_monitor_diagnostic_categories.this[each.key].log_category_groups, "allLogs") ? toset(["allLogs"]) : toset([])
    content {
      category_group = enabled_log.value
    }
  }

  # Fallback for a target that has log categories but no allLogs group.
  dynamic "enabled_log" {
    for_each = contains(data.azurerm_monitor_diagnostic_categories.this[each.key].log_category_groups, "allLogs") ? toset([]) : data.azurerm_monitor_diagnostic_categories.this[each.key].log_category_types
    content {
      category = enabled_log.value
    }
  }

  dynamic "enabled_metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.this[each.key].metrics
    content {
      category = enabled_metric.value
    }
  }
}
