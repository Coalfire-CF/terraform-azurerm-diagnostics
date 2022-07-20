# Coalfire Diagnostic

## Description

Base module that enables 'log' and 'metric' events based on the resource provided.

Directs those events to the log analytics workspace.

## Resource List

These are the resources that this module supports:

- ACR
- Application Gateway
- AKS
- Automation Accounts
- Azure Virtual Desktop
- Cosmos Database
- Event Hub
- Functions
- Firewall
- Key Vault
- Load Balancer
- MySQL Managed Instance
- NSG
- PostgreSQL Managed Instance
- Redis
- SQL
- Storage Accounts
- Subscriptions
- Vnet

**Note:** New resources (Azure products) will need to be added as needed.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| resource_type | The resource type i.e Azure product name (follow CF naming convention) | string | N/A | yes |
| resource_id | Target resource ID | string | N/A | yes |
| diag_log_analytics_id | ID of the Log Analytics Workspace diagnostic logs should be sent to | string | N/A | yes |

## Outputs

| Name | Description |
|------|-------------|

## Usage

```hcl
module "diag" {
  source                = "../../../modules/coalfire-diagnostic/"
  diag_log_analytics_id = var.diag_la_id
  resource_id           = "/subscriptions/c14355b2-e625-4197-9538-b3e72fe41801/resourceGroups/v1-prod-va-mp-management-rg/providers/Microsoft.DBforPostgreSQL/servers/v1-prod-va-mp-jira-psql"
  resource_type         = "psql"
}
```