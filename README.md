# ACE-Azure-Diaganostics

Diagnostic module for Azure. Enables required log settings for supported resources to a Log Analytics Workspace.

## Description

- Terraform Version: 1.1.7
- AzureRM Version: 3.4.0
- Cloud(s) supported:{Government/Commercial} Both
- Cloud(s) verified: Government
- Product Version/License:
- FedRAMP Compliance Support: Moderate, High
- DoD Compliance Support:{IL4/5} IL4, IL5
- Misc Framework Support:
- Launchpad validated version: N/A

## Setup and usage

You can consume this as part of any Azure project. There are no known outside dependencies. View the module README for detailed instructions.

### Code Location

Code should be stored in terraform/modules

### Code updates

If you need to support resources in addition to this list, you will need to creation additional config files.

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
- Log Analytics Workspace
- Load Balancer
- MySQL Managed Instance
- NSG
- PostgreSQL Managed Instance
- Redis
- SQL
- Storage Accounts
- Subscriptions
- Vnet

## Issues

Bug fixes and enhancements are managed, tracked, and discussed through the GitHub issues on this repository.

Issues should be flagged appropriately.

- Bug
- Enhancement
- Documentation
- Code

### Bugs

Bugs are problems that exist with the technology or code that occur when expected behavior does not match implementation.
For example, spelling mistakes on a dashboard.

Use the Bug fix template to describe the issue and expected behaviors.

### Enhancements

Updates and changes to the code to support additional functionality, new features or improve engineering or operations usage of the technology.
For example, adding a new widget to a dashboard to report on failed backups is enhancement.

Use the Enhancement issue template to request enhancements to the codebase. Enhancements should be improvements that are applicable to wide variety of clients and projects. One of updates for a specific project should be handled locally. If you are unsure if something qualifies for an enhancement contact the repository code owner.

### Pull Requests

Code updates ideally are limited in scope to address one enhancement or bug fix per PR. The associated PR should be linked to the relevant issue.

### Code Owners

- Primary Code owner: Douglas Francis (@douglas-f)
- Backup Code owner:

The responsibility of the code owners is to approve and Merge PR's on the repository, and generally manage and direct issue discussions.

### GitHub Actions

Future state. There are current initiatives for running CI/CD tooling as GitHub actions.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_diagnostic_setting.aa_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.acr_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.agw_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.aks_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.avd_hostpool_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.avd_workspace_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.cdb_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.eh_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.file_table_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.func_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.fw_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.kv_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.law_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.lb_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.msql_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.nsg_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.psql_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.rdc_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.rsv_backup_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.rsv_site_recovery_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.sa_blob_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.sa_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.sa_queue_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.sa_table_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.sql_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.sub_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.vnet_diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_diag_log_analytics_id"></a> [diag\_log\_analytics\_id](#input\_diag\_log\_analytics\_id) | ID of the Log Analytics Workspace diagnostic logs should be sent to | `string` | n/a | yes |
| <a name="input_resource_id"></a> [resource\_id](#input\_resource\_id) | Target resource ID | `string` | n/a | yes |
| <a name="input_resource_type"></a> [resource\_type](#input\_resource\_type) | The resource type i.e Azure product name (follow CF naming convention). | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->