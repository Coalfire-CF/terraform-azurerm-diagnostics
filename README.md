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
