variable "location" {
  type = string
  default = "northcentralus"
}

variable "soft_delete_enabled" {
  type = bool
  description = "Enable soft delete"
  default = true
}

variable "lz_rs_rg" {
  type = string
  default = "RG-LZ-Recovery-Services"
}

variable "lz_rsv_name" {
  type = string
  description = "Recovery Services Vault name"
  default = "rsv-lz-recovery-services"
}

variable "lz_rsv_tags" {
  type = map(string)
  description = "The tags for the wan hub."
  default = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }
}