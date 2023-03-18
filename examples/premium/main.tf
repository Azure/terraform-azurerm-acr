provider "azurerm" {
  features {}
}

module "rg" {
  source  = "bcochofel/resource-group/azurerm"
  version = "1.4.0"

  name     = "rg-acr-premium-example"
  location = "North Europe"
}

module "acr" {
  source = "../.."

  name                = "acrpremiumexample"
  resource_group_name = module.rg.name
  sku                 = "Premium"
  admin_enabled       = true
  georeplications = [
    {
      location                = "West Europe"
      zone_redundancy_enabled = true
      tags                    = { "loc" : "west" }
    },
    {
      location                = "North Europe"
      zone_redundancy_enabled = true
      tags                    = { "foo" : "bar" }
    },
  ]

  depends_on = [module.rg]
}
