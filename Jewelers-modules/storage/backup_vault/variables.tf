variable "vault_name" {
  description = "The name of the resource."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location/region where the resource will be deployed."
  type        = string
}

variable "redundancy_type" {
  description = "The redundancy type for the resource."
  type        = string
  default     = "Standard_LRS" # You can set a default value if desired
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
}
