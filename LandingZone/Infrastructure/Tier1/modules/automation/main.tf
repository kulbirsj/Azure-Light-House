resource "azurerm_resource_group" "automation_rg" {
  name     = var.automation_rg_name
  location = var.location
}

resource "azurerm_automation_account" "example" {
  name                = var.automation_account_name
  location            = azurerm_resource_group.automation_rg.location
  resource_group_name = azurerm_resource_group.automation_rg.name

  sku_name = var.automation_account_sku

  tags = var.automation_account_tags
}