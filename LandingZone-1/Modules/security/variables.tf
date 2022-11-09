variable "location" {
  type        = string
  description = "The unique lowercase alpha numeric identifier for resources for the project."
}

variable "log_analytics" {
  description = "The log analytics for platform."
}

variable "platform_alert_email" {
  type        = string
  description = "The email to which security center will be sending emails."
}

variable "platform_asc_logexport_tags" {
  type = map(string)
  description = "The tags for the security_center."
  default = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }
}