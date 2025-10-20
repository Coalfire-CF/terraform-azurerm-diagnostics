provider "azuread" {
  environment = var.environment
  use_cli     = true # The default value is already true, but being explicit. Use Azure CLI authentication via `az login`.
}
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  environment     = var.environment
  use_cli         = true # The default value is already true, but being explicit. Use Azure CLI authentication via `az login`.
}