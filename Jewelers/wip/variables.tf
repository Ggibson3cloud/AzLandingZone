variable "app_gateway_name" {
  description = "The name of the Application Gateway."
  type        = string
}

variable "location" {
  description = "The Azure region where the Application Gateway will be deployed."
  type        = string
}

variable "tags" {
  description = "Tags to associate with the Application Gateway resources."
  type        = map(string)
}

variable "rg_name" {
  description = "The name of the Resource Group in which to create the Application Gateway."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the Application Gateway will be deployed."
  type        = string
}

variable "sku_name" {
  description = "The SKU name of the Application Gateway (e.g., Standard_v2, WAF_v2)."
  type        = string
}

variable "sku_tier" {
  description = "The SKU tier of the Application Gateway (e.g., Standard, WAF)."
  type        = string
}

variable "private_ip_address" {
  description = "The private IP address to assign to the Application Gateway."
  type        = string
  default     = null  # Optional: Set a default value if desired, or leave as null if not required
}
