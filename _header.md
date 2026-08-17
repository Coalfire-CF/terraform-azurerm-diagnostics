![Coalfire](coalfire_logo.png)

# terraform-azurerm-diaganostics

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
- SQL
- Storage Accounts
- Subscriptions
- Vnet
- Web App


### Usage

```hcl
provider "azurerm" {
  features {}
}

module "kv_diag" {
  source                = "github.com/Coalfire-CF/terraform-azurerm-diagnostics"
  diag_log_analytics_id = var.diag_log_analytics_id
  resource_id           = azurerm_key_vault.default.id
  resource_type         = "kv"
}
```

