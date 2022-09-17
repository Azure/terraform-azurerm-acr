locals {
  _identity_type = var.identity_type == "Both" ? "SystemAssigned, UserAssigned" : var.identity_type
}