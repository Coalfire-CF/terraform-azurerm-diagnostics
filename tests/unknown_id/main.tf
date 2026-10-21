terraform {
  required_version = ">= 1.16.6, < 2.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.10"
    }
  }
}

resource "azurerm_resource_group" "this" {
  name     = "rg"
  location = "usgovvirginia"
}

module "diag" {
  source                = "../.."
  resource_type         = "kv"
  resource_id           = azurerm_resource_group.this.id
  diag_log_analytics_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg/providers/Microsoft.OperationalInsights/workspaces/law"
}
