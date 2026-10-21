![Coalfire](coalfire_logo.png)

# terraform-azurerm-diagnostics

Diagnostic module for Azure. Enables FedRAMP required log settings for supported resources to a Log Analytics Workspace.

Learn more at [Coalfire OpenSource](https://coalfire.com/opensource).

## Description

- Cloud(s) supported:{Government/Commercial} Both
- Cloud(s) verified: Government
- Product Version/License:
- FedRAMP Compliance Support: Moderate, High
- DoD Compliance Support:{IL4/5} IL4, IL5
- Misc Framework Support:

## Setup and usage

You can consume this as part of any Azure project. There are no known outside dependencies. View the module README for detailed instructions.

### Code updates

If you need to support resources in addition to this list, you will need to creation additional config files.

These are the resources that this module supports:

- ACR
- Application Gateway
- AKS
- App Service
- App Service Environment
- Automation Accounts
- Azure Virtual Desktop Hostpool
- Azure Virtual Desktop Workspace
- Backup (Recovery Services Vault)
- Cosmos Database
- Data Factory
- Databricks
- Event Hub
- Functions
- Azure Firewall
- Key Vault
- Kusto
- Log Analytics Workspace
- Load Balancer
- Logic App
- MSSQL Database
- MSSQL Elastic Pools
- MSSQL Server
- MySQL Managed Instance
- NSG
- PostgreSQL Managed Instance
- Redis
- Redis Enterprise Cluster
- Redis Enterprise Database (rdedb)
- SQL
- Storage Accounts
- Subscriptions
- Vnet
- Web App

Each setting sends the `allLogs` category group and every metric category the target exposes (usually `AllMetrics`). Categories are read from Azure with `azurerm_monitor_diagnostic_categories`, so the deploying identity needs `Microsoft.Insights/diagnosticSettingsCategories/read` on the target. Pass the target's `id` attribute as `resource_id`; a hand-built ID of a resource that does not exist yet fails at plan. Storage accounts get settings on the account and the blob, queue, table and file services. SQL servers also get a setting on the `master` database so server auditing reaches Log Analytics; remove any other setting on `master` that sends to the same workspace. Redis Enterprise logs are on the database: use `rdedb` with the database ID. Subscriptions send all Activity Log categories. Upgrading an existing v2 deployment in place is not supported.

### Usage

```hcl
provider "azurerm" {
  environment                     = "usgovernment"
  resource_provider_registrations = "none"
  features {}
}

module "kv_diag" {
  source                = "git::https://github.com/Coalfire-CF/terraform-azurerm-diagnostics?ref=v3.0.0"
  diag_log_analytics_id = var.diag_log_analytics_id
  resource_id           = azurerm_key_vault.default.id
  resource_type         = "kv"
}
```

