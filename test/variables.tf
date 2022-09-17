#------------------------------------------------------------------------------------------
# Test environment variables
#------------------------------------------------------------------------------------------

variable "AZURE_SUBSCRIPTION_ID" {
  description = "Subscription ID for testing execution. Don't forget declare it in your environment variables as TF_VAR_AZURE_SUBSCRIPTION_ID."
  type        = string
  default     = null
}

variable "AZURE_CLIENT_ID" {
  description = "Client ID for testing execution. Don't forget declare it in your environment variables as TF_VAR_AZURE_CLIENT_ID."
  type        = string
  default     = null
}

variable "AZURE_CLIENT_SECRET" {
  description = "Client ID for testing execution. Don't forget declare it in your environment variables as TF_VAR_AZURE_CLIENT_SECRET."
  type        = string
  default     = null
}

variable "AZURE_TENANT_ID" {
  description = "Tenant ID for testing execution. Don't forget declare it in your environment variables as TF_VAR_AZURE_TENANT_ID."
  type        = string
  default     = null
}
