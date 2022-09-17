provider "azurerm" {
  features {
  }

  subscription_id = var.AZURE_SUBSCRIPTION_ID #"500c9668-8ffc-4a0b-99c5-fdea7a19790c"
  client_id       = var.AZURE_CLIENT_ID       #"196a9c4d-2a22-4fcc-8337-31cae2abec8f"
  client_secret   = var.AZURE_CLIENT_SECRET   #"PSa8Q~MHeUhMPzOKyyS.fmfmCPifSa4RNq7-ncvE"
  tenant_id       = var.AZURE_TENANT_ID       #"16f15083-eb69-41dd-8f91-3d0997ce821b"
}
