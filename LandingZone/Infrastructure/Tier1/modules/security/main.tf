###########################################
#  Azure Security Center settings         #
###########################################

data "azurerm_client_config" "current" {}

resource "azurerm_security_center_subscription_pricing" "platform_asc_pricing_vms" {
  tier          = "Standard"
  resource_type = "VirtualMachines"
}

resource "azurerm_security_center_subscription_pricing" "platform_asc_pricing_kvs" {
  tier          = "Standard"
  resource_type = "KeyVaults"
}

resource "azurerm_security_center_subscription_pricing" "platform_asc_pricing_sqlvms" {
  tier          = "Standard"
  resource_type = "SqlServerVirtualMachines"
}

resource "azurerm_security_center_subscription_pricing" "platform_asc_pricing_sas" {
  tier          = "Standard"
  resource_type = "StorageAccounts"
}

# Set default Log Analytics workspace for platform subscription
resource "azurerm_security_center_workspace" "platform_asc_workspace" {
  scope        = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
  workspace_id = var.log_analytics.id
  depends_on = [
    azurerm_security_center_subscription_pricing.platform_asc_pricing_vms,
    azurerm_security_center_subscription_pricing.platform_asc_pricing_kvs,
    azurerm_security_center_subscription_pricing.platform_asc_pricing_sqlvms,
    azurerm_security_center_subscription_pricing.platform_asc_pricing_sas
  ]
}

# Enable auto-provisioning of VM agent for platform subscription
resource "azurerm_security_center_auto_provisioning" "platform_asc_autoprovision" {
  auto_provision = "On"
  depends_on     = [azurerm_security_center_workspace.platform_asc_workspace]
}

# Enable email alerts for platform subscription
resource "azurerm_security_center_contact" "platform_asc_alerts" {
  email               = var.platform_alert_email
  alert_notifications = true
  alerts_to_admins    = true
}

# Configure continuous export to Log Analytics
resource "azurerm_security_center_automation" "platform_asc_logexport" {
  name                = "platform_asc_logexport"
  location            = var.location
  resource_group_name = var.log_analytics.resource_group_name
  scopes              = ["/subscriptions/${data.azurerm_client_config.current.subscription_id}"]
  depends_on          = [azurerm_security_center_workspace.platform_asc_workspace]

  action {
    type        = "LogAnalytics"
    resource_id = var.log_analytics.id
  }

  source {
    event_source = "Alerts"
    rule_set {
      rule {
        property_path  = "properties.metadata.severity"
        operator       = "Equals"
        expected_value = "High"
        property_type  = "String"
      }
    }
  }

  tags = var.platform_asc_logexport_tags
}
