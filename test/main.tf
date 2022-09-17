module "module_test" {
  source                = "../../terraform-azurerm-azure_acr"
  create_resource_group = true
  resource_group_name   = "temporal"
  location_name         = "East US"
  registry_name         = "registry01"
  sku                   = "Premium"

  enable_trust_policy = true
  retention_policy = {
    enabled = true
    days    = 10
  }
  replicas = {
    "East US 2" = { enable_zone_redundancy = true, enable_regional_endpoint = true }
    "West US 2" = { enable_zone_redundancy = false, enable_regional_endpoint = true }
  }



  tags = {
    "tempo" = "value1"
    "tag2"  = "value2"
  }
}
