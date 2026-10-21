# Tests override the categories data source, so they prove the mapping logic,
# not which categories Azure returns for each resource type.

mock_provider "azurerm" {}

variables {
  diag_log_analytics_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg/providers/Microsoft.OperationalInsights/workspaces/law"
}

run "key_vault_sends_all_logs_and_all_metrics" {
  command = plan
  variables {
    resource_type = "kv"
    resource_id   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg/providers/Microsoft.KeyVault/vaults/kv"
  }
  override_data {
    target = data.azurerm_monitor_diagnostic_categories.this
    values = {
      log_category_groups = ["allLogs", "audit"]
      log_category_types  = ["AuditEvent"]
      metrics             = ["AllMetrics"]
    }
  }
  assert {
    condition     = length(azurerm_monitor_diagnostic_setting.this) == 1
    error_message = "Key vault must get exactly one diagnostic setting."
  }
  assert {
    condition     = [for l in azurerm_monitor_diagnostic_setting.this["kv"].enabled_log : l.category_group] == ["allLogs"]
    error_message = "Key vault must send the allLogs category group and nothing else."
  }
  assert {
    condition     = [for m in azurerm_monitor_diagnostic_setting.this["kv"].enabled_metric : m.category] == ["AllMetrics"]
    error_message = "Key vault must send AllMetrics."
  }
  assert {
    condition     = azurerm_monitor_diagnostic_setting.this["kv"].log_analytics_workspace_id == var.diag_log_analytics_id
    error_message = "Setting must send to the workspace input."
  }
  assert {
    condition     = azurerm_monitor_diagnostic_setting.this["kv"].target_resource_id == var.resource_id
    error_message = "Setting must target the resource_id input."
  }
  assert {
    condition     = azurerm_monitor_diagnostic_setting.this["kv"].name == "kv_securityLogs"
    error_message = "Setting name must be kv_securityLogs."
  }
}

run "redis_sends_all_logs_not_one_category" {
  command = plan
  variables {
    resource_type = "rdc"
    resource_id   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg/providers/Microsoft.Cache/redis/rdc"
  }
  override_data {
    target = data.azurerm_monitor_diagnostic_categories.this
    values = {
      log_category_groups = ["allLogs", "audit"]
      log_category_types  = ["ConnectedClientList", "MSEntraAuthenticationAuditLog"]
      metrics             = ["AllMetrics"]
    }
  }
  assert {
    condition     = length(azurerm_monitor_diagnostic_setting.this["rdc"].enabled_log) == 1
    error_message = "Redis must have exactly one enabled_log block."
  }
  assert {
    condition     = [for l in azurerm_monitor_diagnostic_setting.this["rdc"].enabled_log : l.category_group] == ["allLogs"]
    error_message = "Redis must send allLogs, not ConnectedClientList only."
  }
  assert {
    condition     = one([for l in azurerm_monitor_diagnostic_setting.this["rdc"].enabled_log : l.category]) == null
    error_message = "Redis allLogs block must not also set a category."
  }
}

run "load_balancer_sends_logs_when_azure_exposes_them" {
  command = plan
  variables {
    resource_type = "lb"
    resource_id   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg/providers/Microsoft.Network/loadBalancers/lb"
  }
  override_data {
    target = data.azurerm_monitor_diagnostic_categories.this
    values = {
      log_category_groups = ["allLogs"]
      log_category_types  = ["LoadBalancerHealthEvent"]
      metrics             = ["AllMetrics"]
    }
  }
  assert {
    condition     = [for l in azurerm_monitor_diagnostic_setting.this["lb"].enabled_log : l.category_group] == ["allLogs"]
    error_message = "Load balancer must send allLogs when Azure exposes logs."
  }
  assert {
    condition     = [for m in azurerm_monitor_diagnostic_setting.this["lb"].enabled_metric : m.category] == ["AllMetrics"]
    error_message = "Load balancer must send AllMetrics."
  }
}

run "metrics_only_target_has_no_log_block" {
  command = plan
  variables {
    resource_type = "rdec"
    resource_id   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg/providers/Microsoft.Cache/redisEnterprise/rdec"
  }
  override_data {
    target = data.azurerm_monitor_diagnostic_categories.this
    values = {
      log_category_groups = []
      log_category_types  = []
      metrics             = ["AllMetrics"]
    }
  }
  assert {
    condition     = length(azurerm_monitor_diagnostic_setting.this["rdec"].enabled_log) == 0
    error_message = "A metrics-only target must have no enabled_log block."
  }
  assert {
    condition     = [for m in azurerm_monitor_diagnostic_setting.this["rdec"].enabled_metric : m.category] == ["AllMetrics"]
    error_message = "A metrics-only target must send AllMetrics."
  }
}

run "fallback_lists_categories_without_all_logs_group" {
  command = plan
  variables {
    resource_type = "vnet"
    resource_id   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/vnet"
  }
  override_data {
    target = data.azurerm_monitor_diagnostic_categories.this
    values = {
      log_category_groups = []
      log_category_types  = ["A", "B"]
      metrics             = []
    }
  }
  assert {
    condition     = toset([for l in azurerm_monitor_diagnostic_setting.this["vnet"].enabled_log : l.category]) == toset(["A", "B"])
    error_message = "Without an allLogs group, every log category must be listed."
  }
  assert {
    condition     = length(azurerm_monitor_diagnostic_setting.this["vnet"].enabled_metric) == 0
    error_message = "A target with no metrics must have no enabled_metric block."
  }
}

run "storage_targets_account_and_four_services" {
  command = plan
  variables {
    resource_type = "sa"
    resource_id   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg/providers/Microsoft.Storage/storageAccounts/sa"
  }
  override_data {
    target = data.azurerm_monitor_diagnostic_categories.this
    values = {
      log_category_groups = ["allLogs"]
      log_category_types  = ["StorageRead"]
      metrics             = ["Capacity", "Transaction"]
    }
  }
  assert {
    condition     = keys(azurerm_monitor_diagnostic_setting.this) == ["sa", "sa_blob", "sa_file", "sa_queue", "sa_table"]
    error_message = "Storage must get settings on the account and its four services."
  }
  assert {
    condition     = azurerm_monitor_diagnostic_setting.this["sa_queue"].target_resource_id == "${var.resource_id}/queueServices/default"
    error_message = "Queue target must be <account>/queueServices/default with no trailing slash."
  }
  assert {
    condition     = toset([for m in azurerm_monitor_diagnostic_setting.this["sa_blob"].enabled_metric : m.category]) == toset(["Capacity", "Transaction"])
    error_message = "Blob service must send every metric category Azure exposes."
  }
}

run "mssql_server_targets_master_for_audit" {
  command = plan
  variables {
    resource_type = "mssql"
    resource_id   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg/providers/Microsoft.Sql/servers/sql"
  }
  override_data {
    target = data.azurerm_monitor_diagnostic_categories.this
    values = {
      log_category_groups = ["allLogs"]
      log_category_types  = ["SQLSecurityAuditEvents"]
      metrics             = ["AllMetrics"]
    }
  }
  assert {
    condition     = keys(azurerm_monitor_diagnostic_setting.this) == ["mssql", "mssql_master"]
    error_message = "SQL server must get settings on the server and its master database."
  }
  assert {
    condition     = azurerm_monitor_diagnostic_setting.this["mssql_master"].target_resource_id == "${var.resource_id}/databases/master"
    error_message = "Master setting must target <server>/databases/master."
  }
  assert {
    condition     = azurerm_monitor_diagnostic_setting.this["mssql_master"].name == "mssql_master_securityLogs"
    error_message = "Master setting name must be mssql_master_securityLogs."
  }
  assert {
    condition     = [for l in azurerm_monitor_diagnostic_setting.this["mssql_master"].enabled_log : l.category_group] == ["allLogs"]
    error_message = "Master setting must send allLogs."
  }
  assert {
    condition     = azurerm_mssql_server_extended_auditing_policy.mssql_audit_policy[0].log_monitoring_enabled == true
    error_message = "Server auditing must send to Log Analytics."
  }
}

run "mssql_database_audit_policy" {
  command = plan
  variables {
    resource_type = "mssqldb"
    resource_id   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg/providers/Microsoft.Sql/servers/sql/databases/db"
  }
  override_data {
    target = data.azurerm_monitor_diagnostic_categories.this
    values = {
      log_category_groups = ["allLogs"]
      log_category_types  = ["SQLSecurityAuditEvents"]
      metrics             = ["Basic"]
    }
  }
  assert {
    condition     = azurerm_mssql_database_extended_auditing_policy.mssql_db_audit_policy[0].log_monitoring_enabled == true
    error_message = "Database auditing must send to Log Analytics."
  }
  assert {
    condition     = [for l in azurerm_monitor_diagnostic_setting.this["mssqldb"].enabled_log : l.category_group] == ["allLogs"]
    error_message = "Database setting must send allLogs."
  }
}

run "recovery_vault_single_dedicated_setting" {
  command = plan
  variables {
    resource_type = "rsv"
    resource_id   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg/providers/Microsoft.RecoveryServices/vaults/rsv"
  }
  override_data {
    target = data.azurerm_monitor_diagnostic_categories.this
    values = {
      log_category_groups = ["allLogs"]
      log_category_types  = ["CoreAzureBackup", "AzureSiteRecoveryJobs"]
      metrics             = ["Health"]
    }
  }
  assert {
    condition     = length(azurerm_monitor_diagnostic_setting.this) == 1
    error_message = "Recovery vault must get one setting, not one per service."
  }
  assert {
    condition     = azurerm_monitor_diagnostic_setting.this["rsv"].log_analytics_destination_type == "Dedicated"
    error_message = "Recovery vault must use resource-specific (Dedicated) tables."
  }
  assert {
    condition     = [for l in azurerm_monitor_diagnostic_setting.this["rsv"].enabled_log : l.category_group] == ["allLogs"]
    error_message = "Recovery vault must send allLogs."
  }
}

run "cosmos_destination_type" {
  command = plan
  variables {
    resource_type = "cdb"
    resource_id   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg/providers/Microsoft.DocumentDB/databaseAccounts/cdb"
  }
  override_data {
    target = data.azurerm_monitor_diagnostic_categories.this
    values = {
      log_category_groups = ["allLogs"]
      log_category_types  = ["DataPlaneRequests"]
      metrics             = ["Requests"]
    }
  }
  assert {
    condition     = azurerm_monitor_diagnostic_setting.this["cdb"].log_analytics_destination_type == "AzureDiagnostics"
    error_message = "Cosmos DB must keep the AzureDiagnostics destination type."
  }
}

run "redis_enterprise_database" {
  command = plan
  variables {
    resource_type = "rdedb"
    resource_id   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg/providers/Microsoft.Cache/redisEnterprise/rdec/databases/default"
  }
  override_data {
    target = data.azurerm_monitor_diagnostic_categories.this
    values = {
      log_category_groups = ["allLogs"]
      log_category_types  = ["ConnectionEvents"]
      metrics             = []
    }
  }
  assert {
    condition     = length(azurerm_monitor_diagnostic_setting.this) == 1
    error_message = "Redis Enterprise database must get one setting."
  }
  assert {
    condition     = [for l in azurerm_monitor_diagnostic_setting.this["rdedb"].enabled_log : l.category_group] == ["allLogs"]
    error_message = "Redis Enterprise database must send allLogs."
  }
}

run "subscription_sends_all_activity_log_categories" {
  command = plan
  variables {
    resource_type = "sub"
    resource_id   = "/subscriptions/00000000-0000-0000-0000-000000000000"
  }
  assert {
    condition     = length(azurerm_monitor_diagnostic_setting.this) == 0
    error_message = "Subscription must not get a resource diagnostic setting."
  }
  assert {
    condition = toset([for l in azurerm_monitor_diagnostic_setting.sub_diag[0].enabled_log : l.category]) == toset([
      "Administrative", "Alert", "Autoscale", "Policy", "Recommendation", "ResourceHealth", "Security", "ServiceHealth",
    ])
    error_message = "Subscription must send all eight Activity Log categories."
  }
}

run "plans_with_unknown_resource_id" {
  command = plan
  module {
    source = "./tests/unknown_id"
  }
}

run "rejects_unknown_resource_type" {
  command = plan
  variables {
    resource_type = "nope"
    resource_id   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg/providers/Microsoft.KeyVault/vaults/kv"
  }
  expect_failures = [var.resource_type]
}

run "rejects_target_with_no_categories" {
  command = plan
  variables {
    resource_type = "lb"
    resource_id   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg/providers/Microsoft.Network/loadBalancers/lb"
  }
  override_data {
    target = data.azurerm_monitor_diagnostic_categories.this
    values = {
      log_category_groups = []
      log_category_types  = []
      metrics             = []
    }
  }
  expect_failures = [data.azurerm_monitor_diagnostic_categories.this]
}
