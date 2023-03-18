provider "azurerm" {
  features {}
}

module "rg" {
  source  = "bcochofel/resource-group/azurerm"
  version = "1.4.0"

  name     = "rg-acr-basic-example"
  location = "North Europe"
}

module "acr" {
  source = "../.."

  name                = "acrbasicexample"
  resource_group_name = module.rg.name

  sku           = "Basic"
  admin_enabled = false

  depends_on = [module.rg]
}
