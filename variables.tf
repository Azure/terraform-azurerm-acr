variable "resource_group_name" {
  description = <<EOT
The name of the resource group in which to create the ACR.
The Resource Group must already exist.
EOT
  type        = string
}

variable "name" {
  description = <<EOT
Specifies the name of the Container Registry.
Changing this forces a new resource to be created.
EOT
  type        = string

  validation {
    condition     = length(var.name) >= 5 && length(var.name) <= 50 && can(regex("^[a-zA-Z0-9]+$", var.name))
    error_message = "Invalid name (check Azure Resource naming restrictions for more info)."
  }
}

variable "tags" {
  description = "A mapping of tags which should be assigned to Resources."
  type        = map(string)
  default     = {}
}

variable "sku" {
  description = <<EOT
The SKU name of the container registry.
Possible values are Basic, Standard and Premium.
EOT
  type        = string
  default     = "Premium"
}

variable "admin_enabled" {
  description = "Specifies whether the admin user is enabled."
  type        = bool
  default     = true
}

variable "georeplications" {
  description = <<EOT
A list of Azure locations where the container registry should be geo-replicated
(sku must be Premium).
EOT
  type = list(object({
    location                  = string
    zone_redundancy_enabled   = optional(bool)
    regional_endpoint_enabled = optional(bool)
    tags                      = optional(map(string))
  }))
  default = []
}


