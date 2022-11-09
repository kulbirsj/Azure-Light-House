resource "azurerm_management_group" "mainmanagement_group" {
  
  display_name = var.mainmanagement_group1_display_name

  }

resource "azurerm_management_group" "management_group1" {
  
  display_name = var.management_group1_display_name
  parent_management_group_id = azurerm_management_group.mainmanagement_group.id

  subscription_ids = var.management_group1_subscription_ids
  }
/*
  resource "azurerm_management_group" "management_group2" {
  
  display_name = var.management_group2_display_name

  parent_management_group_id = azurerm_management_group.mainmanagement_group.id

  # subscription_ids = var.management_group2_subscription_ids
  }

  resource "azurerm_management_group" "management_group3" {
  
  display_name = var.management_group3_display_name

  parent_management_group_id = azurerm_management_group.mainmanagement_group.id

  # subscription_ids = var.management_group3_subscription_ids
  } 
  */