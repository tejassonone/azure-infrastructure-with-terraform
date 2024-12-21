variable "client_id" {
  description = "The Client ID for the Azure Active Directory application (Service Principal)"
  type        = string
}

variable "client_secret" {
  description = "The Client Secret for the Azure Active Directory application (Service Principal)"
  type        = string
  sensitive   = true  
}

variable "tenant_id" {
  description = "The Tenant ID for the Azure Active Directory"
  type        = string
}

variable "subscription_id" {
  description = "The Azure Subscription ID"
  type        = string
}


variable "account_tier" {
  description = "Account tier for storage account"
  type        = string
}

variable "account_replication_type" {
  description = "account replication type for storage account"
  type        = string
}