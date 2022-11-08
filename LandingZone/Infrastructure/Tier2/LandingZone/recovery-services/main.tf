
# Lz Recovery Services
resource "azurerm_resource_group" "lz_recovery_services_rg" {
  name     = var.lz_rs_rg
  location = var.location
}

resource "azurerm_recovery_services_vault" "lz_recovery_services_rg_recovery_vault" {
  name                = var.lz_rsv_name
  location            = azurerm_resource_group.lz_recovery_services_rg.location
  resource_group_name = azurerm_resource_group.lz_recovery_services_rg.name
  sku                 = "Standard"
  tags                = var.lz_rsv_tags
  soft_delete_enabled = var.soft_delete_enabled
}
