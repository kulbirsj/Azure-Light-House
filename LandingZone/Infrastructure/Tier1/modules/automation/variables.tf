variable "location" {
  type        = string
  description = "Region in which to deploy resources."
}

variable "automation_rg_name" {
  type        = string
  description = "The name of the automation resource group."
  default     = "rg-automation-prod-001"
}

variable "automation_account_name" {
  type = string
  description = "Name of the Automation Account"
  default = "aa-autiomation-prod-001"
}

variable "automation_account_sku" {
  type        = string
  description = "The SKU"
  default     = "Basic"
}

variable "automation_account_tags" {
  type        = map(string)
  description = "The tags to be applied to the automation account at creation."
  default = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }
}
