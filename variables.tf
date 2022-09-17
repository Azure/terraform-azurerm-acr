#------------------------------------------------------------------------------------------
# Action variables
#------------------------------------------------------------------------------------------

variable "create_resource_group" {
  description = "Action for creation or not of the resource group"
  type        = bool
  default     = false
}

#------------------------------------------------------------------------------------------
# Information variables
#------------------------------------------------------------------------------------------

variable "registry_name" {
  description = "(Required) Specifies the name of the Container Registry. Only Alphanumeric characters allowed. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "sku" {
  description = "(Required) The SKU name of the container registry. Possible values are Basic, Standard and Premium, by default it is set to Basic."
  type        = string
  default     = "Basic"
}

variable "enable_admin" {
  description = "(Optional) Specifies whether the admin user is enabled. Defaults to false."
  type        = bool
  default     = null
}

variable "enable_public_access" {
  description = "(Optional) Whether public network access is allowed for the container registry. Defaults to true."
  type        = bool
  default     = null
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the Container Registry. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "location_name" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource. Use the map of {tag = value} format."
  type        = map(string)
  default     = {}
}

variable "enable_quarantine_policy" {
  description = "(Optional) Boolean value that indicates whether quarantine policy is enabled. Defaults to false."
  type        = bool
  default     = null
}

variable "enable_export_policy" {
  description = "(Optional) Boolean value that indicates whether export policy is enabled. Defaults to true. In order to set it to false, make sure the public_network_access_enabled is also set to false."
  type        = bool
  default     = null
}

variable "enable_zone_redundancy" {
  description = "(Optional) Whether zone redundancy is enabled for this Container Registry? Changing this forces a new resource to be created. Defaults to false."
  type        = bool
  default     = null
}

variable "enable_trust_policy" {
  description = "(Optional) Boolean value that indicates whether the policy is enabled."
  type        = bool
  default     = null
}

variable "enable_anonymous_pull" {
  description = "(Optional) Whether allows anonymous (unauthenticated) pull access to this Container Registry? Defaults to false. This is only supported on resources with the Standard or Premium SKU."
  type        = bool
  default     = null
}

variable "enable_data_endpoint" {
  description = "(Optional) Whether to enable dedicated data endpoints for this Container Registry? Defaults to false. This is only supported on resources with the Premium SKU."
  type        = bool
  default     = null
}

variable "network_bypass" {
  description = "(Optional) Whether to allow trusted Azure services to access a network restricted Container Registry? Possible values are None and AzureServices. Defaults to AzureServices."
  type        = string
  default     = null
}

variable "retention_policy" {
  description = "(Opcional) Object with values of retention policy, contains boolean value that indicates whether the policy is enabled and number of days to retain."
  type = object({
    enabled = bool
    days    = number
  })
  default = null
}

variable "replicas" {
  description = "(Opcional) Object with values of retention policy, contains boolean value that indicates whether the policy is enabled and number of days to retain. Use the format 'identifier of region' = { enable_zone_redundancy = true/false, enable_regional_endpoint = true/false}"
  type = map(object({
    enable_zone_redundancy   = bool
    enable_regional_endpoint = bool
  }))
  default = null
}

variable "identity_type" {
  description = "(Optional) Identity type of the container registry. Possible values are 'SystemAssigned', 'UserAssigned' or 'Both' (Literal)."
  type        = string
  default     = null
}

variable "identity_list" {
  description = "(Opcional) Object with values of retention policy, contains boolean value that indicates whether the policy is enabled and number of days to retain. Use the format 'identifier of region' = { enable_zone_redundancy = true/false, enable_regional_endpoint = true/false}"
  type        = list(string)
  default     = null
}
