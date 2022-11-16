#Global
#The location in Azure that objects will be created in
location = "Canada Central"

#The company name
company_name = "DevTest"

# Management Groups
mainmanagement_group1_display_name = "ASKJ"
management_group1_display_name = "Production"
management_group1_subscription_ids = ["773c2382-4ca2-4547-8889-14bd1d86df9d"]
#management_group2_display_name = "Landing Zone"
#management_group2_subscription_ids = [""]
#management_group3_display_name = "User-Test"
#management_group3_subscription_ids = [""]

#Azure Standard Policies

policy_allowed_regions_enable = true
policy_allowed_regions_list = [
       "Canada Central", "Canada East"
]
policy_allowed_storage_skus_enable = true
policy_allowed_storage_skus_list = [
    "Standard_LRS",
  "Standard_GRS",
  "Standard_RAGRS",
  "Standard_ZRS",
  "Premium_LRS",
]
policy_allowed_vm_skus_enable = true
policy_allowed_vm_skus_list = [
    "Standard_B1ls", "Standard_B1ms", "Standard_B1s", "Standard_B2ms", "Standard_B2s", "Standard_B4ms", "Standard_B8ms", "Standard_B12ms", "Standard_B16ms", "Standard_B20ms", "Standard_D1_v2", "Standard_D2_v2", "Standard_D3_v2", "Standard_D4_v2", "Standard_D5_v2", "Standard_D11_v2", "Standard_D12_v2", "Standard_D13_v2", "Standard_D14_v2", "Standard_D15_v2", "Standard_F1", "Standard_F2", "Standard_F4", "Standard_F8", "Standard_F16", "Standard_DS1_v2", "Standard_DS2_v2", "Standard_DS3_v2", "Standard_DS4_v2", "Standard_DS5_v2", "Standard_DS11-1_v2", "Standard_DS11_v2", "Standard_DS12-1_v2", "Standard_DS12-2_v2", "Standard_DS12_v2", "Standard_DS13-2_v2", "Standard_DS13-4_v2", "Standard_DS13_v2", "Standard_DS14-4_v2", "Standard_DS14-8_v2", "Standard_DS14_v2", "Standard_DS15_v2", "Standard_F1s", "Standard_F2s", "Standard_F4s", "Standard_F8s", "Standard_F16s", "Standard_A1_v2", "Standard_A2m_v2", "Standard_A2_v2", "Standard_A4m_v2", "Standard_A4_v2", "Standard_A8m_v2", "Standard_A8_v2", "Standard_D2_v3", "Standard_D4_v3", "Standard_D8_v3", "Standard_D16_v3", "Standard_D32_v3", "Standard_D48_v3", "Standard_D64_v3", "Standard_D2s_v3", "Standard_D4s_v3", "Standard_D8s_v3", "Standard_D16s_v3", "Standard_D32s_v3", "Standard_D48s_v3", "Standard_D64s_v3", "Standard_E2_v3", "Standard_E4_v3", "Standard_E8_v3", "Standard_E16_v3", "Standard_E20_v3", "Standard_E32_v3", "Standard_E48_v3", "Standard_E64i_v3", "Standard_E64_v3", "Standard_E2s_v3", "Standard_E4-2s_v3", "Standard_E4s_v3", "Standard_E8-2s_v3     ", "Standard_E8-4s_v3", "Standard_E8s_v3", "Standard_E16-4s_v3", "Standard_E16-8s_v3", "Standard_E16s_v3", "Standard_E20s_v3", "Standard_E32-8s_v3", "Standard_E32-16s_v3", "Standard_E32s_v3", "Standard_E48s_v3", "Standard_E64-16s_v3", "Standard_E64-32s_v3", "Standard_E64is_v3", "Standard_E64s_v3", "Standard_D2ds_v4", "Standard_D4ds_v4", "Standard_D8ds_v4", "Standard_D16ds_v4", "Standard_D32ds_v4", "Standard_D48ds_v4", "Standard_D64ds_v4", "Standard_D2ds_v5", "Standard_D4ds_v5", "Standard_D8ds_v5", "Standard_D16ds_v5", "Standard_D32ds_v5", "Standard_D48ds_v5", "Standard_D64ds_v5", "Standard_D96ds_v5", "Standard_D2d_v4", "Standard_D4d_v4", "Standard_D8d_v4", "Standard_D16d_v4", "Standard_D32d_v4", "Standard_D48d_v4", "Standard_D64d_v4", "Standard_D2d_v5", "Standard_D4d_v5", "Standard_D8d_v5", "Standard_D16d_v5", "Standard_D32d_v5", "Standard_D48d_v5", "Standard_D64d_v5", "Standard_D96d_v5", "Standard_D2s_v4       ", "Standard_D4s_v4", "Standard_D8s_v4", "Standard_D16s_v4", "Standard_D32s_v4", "Standard_D48s_v4", "Standard_D64s_v4", "Standard_D2s_v5", "Standard_D4s_v5", "Standard_D8s_v5", "Standard_D16s_v5", "Standard_D32s_v5", "Standard_D48s_v5", "Standard_D64s_v5", "Standard_D96s_v5", "Standard_D2_v4", "Standard_D4_v4", "Standard_D8_v4", "Standard_D16_v4", "Standard_D32_v4", "Standard_D48_v4", "Standard_D64_v4", "Standard_D2_v5", "Standard_D4_v5", "Standard_D8_v5", "Standard_D16_v5", "Standard_D32_v5", "Standard_D48_v5", "Standard_D64_v5", "Standard_D96_v5", "Standard_E2ds_v4", "Standard_E4-2ds_v4", "Standard_E4ds_v4", "Standard_E8-2ds_v4", "Standard_E8-4ds_v4", "Standard_E8ds_v4", "Standard_E16-4ds_v4", "Standard_E16-8ds_v4", "Standard_E16ds_v4", "Standard_E20ds_v4", "Standard_E32-8ds_v4", "Standard_E32-16ds_v4  ", "Standard_E32ds_v4", "Standard_E48ds_v4", "Standard_E64-16ds_v4", "Standard_E64-32ds_v4", "Standard_E64ds_v4", "Standard_E2ds_v5", "Standard_E4-2ds_v5", "Standard_E4ds_v5", "Standard_E8-2ds_v5", "Standard_E8-4ds_v5", "Standard_E8ds_v5", "Standard_E16-4ds_v5", "Standard_E16-8ds_v5", "Standard_E16ds_v5", "Standard_E20ds_v5", "Standard_E32-8ds_v5", "Standard_E32-16ds_v5", "Standard_E32ds_v5", "Standard_E48ds_v5", "Standard_E64-16ds_v5", "Standard_E64-32ds_v5", "Standard_E64ds_v5", "Standard_E96-24ds_v5", "Standard_E96-48ds_v5", "Standard_E96ds_v5", "Standard_E104ids_v5", "Standard_E2d_v4", "Standard_E4d_v4", "Standard_E8d_v4", "Standard_E16d_v4", "Standard_E20d_v4", "Standard_E32d_v4", "Standard_E48d_v4", "Standard_E64d_v4", "Standard_E2d_v5", "Standard_E4d_v5", "Standard_E8d_v5", "Standard_E16d_v5", "Standard_E20d_v5", "Standard_E32d_v5", "Standard_E48d_v5", "Standard_E64d_v5", "Standard_E96d_v5", "Standard_E104id_v5", "Standard_E2s_v4", "Standard_E4-2s_v4", "Standard_E4s_v4", "Standard_E8-2s_v4", "Standard_E8-4s_v4", "Standard_E8s_v4", "Standard_E16-4s_v4", "Standard_E16-8s_v4", "Standard_E16s_v4", "Standard_E20s_v4", "Standard_E32-8s_v4", "Standard_E32-16s_v4", "Standard_E32s_v4", "Standard_E48s_v4", "Standard_E64-16s_v4", "Standard_E64-32s_v4", "Standard_E64s_v4", "Standard_E2s_v5", "Standard_E4-2s_v5", "Standard_E4s_v5", "Standard_E8-2s_v5", "Standard_E8-4s_v5", "Standard_E8s_v5", "Standard_E16-4s_v5", "Standard_E16-8s_v5", "Standard_E16s_v5      ", "Standard_E20s_v5", "Standard_E32-8s_v5", "Standard_E32-16s_v5", "Standard_E32s_v5", "Standard_E48s_v5", "Standard_E64-16s_v5", "Standard_E64-32s_v5", "Standard_E64s_v5", "Standard_E96-24s_v5   ", "Standard_E96-48s_v5", "Standard_E96s_v5", "Standard_E104is_v5", "Standard_E2_v4", "Standard_E4_v4", "Standard_E8_v4", "Standard_E16_v4", "Standard_E20_v4", "Standard_E32_v4", "Standard_E48_v4", "Standard_E64_v4", "Standard_E2_v5", "Standard_E4_v5", "Standard_E8_v5", "Standard_E16_v5", "Standard_E20_v5", "Standard_E32_v5", "Standard_E48_v5", "Standard_E64_v5", "Standard_E96_v5", "Standard_E104i_v5", "Standard_F2s_v2", "Standard_F4s_v2", "Standard_F8s_v2", "Standard_F16s_v2", "Standard_F32s_v2", "Standard_F48s_v2", "Standard_F64s_v2", "Standard_F72s_v2      ", "Standard_E2bs_v5", "Standard_E4bs_v5", "Standard_E8bs_v5", "Standard_E16bs_v5", "Standard_E32bs_v5", "Standard_E48bs_v5", "Standard_E64bs_v5", "Standard_E2bds_v5", "Standard_E4bds_v5", "Standard_E8bds_v5", "Standard_E16bds_v5", "Standard_E32bds_v5", "Standard_E48bds_v5", "Standard_E64bds_v5", "Standard_M64", "Standard_M64m", "Standard_M128", "Standard_M128m", "Standard_M8-2ms", "Standard_M8-4ms", "Standard_M8ms", "Standard_M16-4ms", "Standard_M16-8ms", "Standard_M16ms", "Standard_M32-8ms", "Standard_M32-16ms", "Standard_M32ls", "Standard_M32ms", "Standard_M32ts", "Standard_M64-16ms", "Standard_M64-32ms     ", "Standard_M64ls", "Standard_M64ms", "Standard_M64s", "Standard_M128-32ms", "Standard_M128-64ms", "Standard_M128ms", "Standard_M128s", "Standard_M32ms_v2", "Standard_M64ms_v2", "Standard_M64s_v2", "Standard_M128ms_v2", "Standard_M128s_v2", "Standard_M192ims_v2", "Standard_M192is_v2", "Standard_M32dms_v2", "Standard_M64dms_v2", "Standard_M64ds_v2", "Standard_M128dms_v2", "Standard_M128ds_v2", "Standard_M192idms_v2", "Standard_M192ids_v2", "Standard_A0", "Standard_A1", "Standard_A2", "Standard_A3", "Standard_A5", "Standard_A4", "Standard_A6", "Standard_A7", "Basic_A0", "Basic_A1", "Basic_A2", "Basic_A3", "Basic_A4", "Standard_D1", "Standard_D2", "Standard_D3", "Standard_D4", "Standard_D11", "Standard_D12", "Standard_D13", "Standard_D14", "Standard_DS1", "Standard_DS2", "Standard_DS3", "Standard_DS4", "Standard_DS11", "Standard_DS12", "Standard_DS13", "Standard_DS14", "Standard_M208ms_v2", "Standard_M208s_v2", "Standard_M416-208s_v2", "Standard_M416s_v2", "Standard_M416-208ms_v2", "Standard_M416ms_v2", "Standard_L8s_v3", "Standard_L16s_v3", "Standard_L32s_v3", "Standard_L48s_v3", "Standard_L64s_v3", "Standard_L80s_v3", "Standard_DC8_v2", "Standard_DC1s_v2", "Standard_DC2s_v2", "Standard_DC4s_v2", "Standard_E80is_v4", "Standard_E80ids_v4", "Standard_HB120-16rs_v2", "Standard_HB120-32rs_v2", "Standard_HB120-64rs_v2", "Standard_HB120-96rs_v2", "Standard_HB120rs_v2", "Standard_D2a_v4", "Standard_D4a_v4", "Standard_D8a_v4", "Standard_D16a_v4", "Standard_D32a_v4", "Standard_D48a_v4", "Standard_D64a_v4", "Standard_D96a_v4", "Standard_D2as_v4", "Standard_D4as_v4", "Standard_D8as_v4", "Standard_D16as_v4", "Standard_D32as_v4", "Standard_D48as_v4", "Standard_D64as_v4", "Standard_D96as_v4", "Standard_E2a_v4", "Standard_E4a_v4", "Standard_E8a_v4", "Standard_E16a_v4", "Standard_E20a_v4", "Standard_E32a_v4", "Standard_E48a_v4", "Standard_E64a_v4", "Standard_E96a_v4", "Standard_E2as_v4", "Standard_E4-2as_v4", "Standard_E4as_v4", "Standard_E8-2as_v4", "Standard_E8-4as_v4", "Standard_E8as_v4", "Standard_E16-4as_v4", "Standard_E16-8as_v4", "Standard_E16as_v4", "Standard_E20as_v4", "Standard_E32-8as_v4", "Standard_E32-16as_v4", "Standard_E32as_v4", "Standard_E48as_v4", "Standard_E64-16as_v4", "Standard_E64-32as_v4", "Standard_E64as_v4", "Standard_E96-24as_v4", "Standard_E96-48as_v4", "Standard_E96as_v4", "Standard_D2as_v5", "Standard_D4as_v5", "Standard_D8as_v5", "Standard_D16as_v5", "Standard_D32as_v5", "Standard_D48as_v5", "Standard_D64as_v5", "Standard_D96as_v5", "Standard_E2as_v5", "Standard_E4-2as_v5", "Standard_E4as_v5", "Standard_E8-2as_v5", "Standard_E8-4as_v5", "Standard_E8as_v5", "Standard_E16-4as_v5", "Standard_E16-8as_v5", "Standard_E16as_v5", "Standard_E20as_v5", "Standard_E32-8as_v5", "Standard_E32-16as_v5", "Standard_E32as_v5", "Standard_E48as_v5", "Standard_E64-16as_v5", "Standard_E64-32as_v5", "Standard_E64as_v5", "Standard_E96-24as_v5", "Standard_E96-48as_v5", "Standard_E96as_v5", "Standard_E112ias_v5", "Standard_D2ads_v5", "Standard_D4ads_v5", "Standard_D8ads_v5", "Standard_D16ads_v5", "Standard_D32ads_v5", "Standard_D48ads_v5    ", "Standard_D64ads_v5", "Standard_D96ads_v5", "Standard_E2ads_v5", "Standard_E4-2ads_v5", "Standard_E4ads_v5", "Standard_E8-2ads_v5", "Standard_E8-4ads_v5", "Standard_E8ads_v5", "Standard_E16-4ads_v5", "Standard_E16-8ads_v5", "Standard_E16ads_v5", "Standard_E20ads_v5", "Standard_E32-8ads_v5", "Standard_E32-16ads_v5", "Standard_E32ads_v5", "Standard_E48ads_v5", "Standard_E64-16ads_v5", "Standard_E64-32ads_v5", "Standard_E64ads_v5", "Standard_E96-24ads_v5", "Standard_E96-48ads_v5", "Standard_E96ads_v5", "Standard_E112iads_v5", "Standard_L8as_v3", "Standard_L16as_v3", "Standard_L32as_v3", "Standard_L48as_v3", "Standard_L64as_v3", "Standard_L80as_v3", "Standard_NV4as_v4", "Standard_NV8as_v4", "Standard_NV16as_v4", "Standard_NV32as_v4", "Standard_G1", "Standard_G2", "Standard_G3", "Standard_G4", "Standard_G5", "Standard_GS1", "Standard_GS2", "Standard_GS3", "Standard_GS4", "Standard_GS4-4", "Standard_GS4-8", "Standard_GS5", "Standard_GS5-8", "Standard_GS5-16", "Standard_L4s", "Standard_L8s", "Standard_L16s", "Standard_L32s", "Standard_NC6s_v3", "Standard_NC12s_v3", "Standard_NC24rs_v3", "Standard_NC24s_v3", "Standard_DC1s_v3", "Standard_DC2s_v3", "Standard_DC4s_v3", "Standard_DC8s_v3", "Standard_DC16s_v3", "Standard_DC24s_v3", "Standard_DC32s_v3", "Standard_DC48s_v3", "Standard_DC1ds_v3", "Standard_DC2ds_v3", "Standard_DC4ds_v3", "Standard_DC8ds_v3", "Standard_DC16ds_v3", "Standard_DC24ds_v3", "Standard_DC32ds_v3", "Standard_DC48ds_v3"
]
policy_deny_ip_forwarding_enable = true
policy_prevent_inbound_rdp_enable = true
policy_associate_with_nsg_enable = true
policy_networkwatcher_deploy_enable = true
networkwatcher_rg = "NetworkWatcherRG"
networkwatcher_locations = [
    "Canada Central"
]
policy_networkwatcher_enabled_audit_enable = true
policy_https_to_storage_enable = true
policy_sql_encryption_enable = true
policy_invalid_resource_types_enable = true

policy_invalid_resource_types_list =  [
    "Microsoft.MixedReality",
    "Microsoft.Maps",
    "Microsoft.DataMigration"
]
policy_security_center_deploy_enable = true
# Adds the specified tag with its value from the containing subscription when any resource missing this tag is created or updated. Existing resources can be remediated by triggering a remediation task. If the tag exists with a different value it will not be changed."
policy_inherit_tags = [
    "CostCenter = None",
    "Env        = prod",
    "AppOwner    = IT"
]
policy_asc_monitoring_enable = true
policy_enforce_inguest_monitoring_enable = true
policy_enforce_vm_backup_enable = true
policy_audit_diagnostics_enable = true
policy_audit_diagnostics_types_list = [
    "Microsoft.Compute",
    "Microsoft.Network"
]
policy_audit_sqlservers_enable = true
#Tags required on Resource Groups
policy_required_tags = {
   Env         = "prod"
  Backup      = "yes"
  AppOwner    = "IT"
  Application = "DC"
  Schedule    = "24x7"
}
#Which tags resources should inherit from their Resource Groups
policy_inherit_RG_tags = [
  "Env",
  "AppOwner",
  "Backup",
  "Schedule"
]

# Additional Resoruce Groups

additional_resource_groups = {
  #rg-prod-cac-dc = "Canada Central",
  rg-prod-cac-sql = "Canada Central",
  rg-prod-cac-web = "Canada Central"
}

#Landing Zone Virtual Network

#Resource Group Name for Networking RG
network_rg_name = "rg-prod-cac-vnet-hub"
#Virtual network Name
landingzone_vnet_name = "Vnet-prod-cac-az-hub"
#Virtual Network address space. 
#Separate with commas. Example: ["10.0.0.0/16","10.0.1.0/16"]
landingzone_vnet_address_space = ["172.21.0.0/21"]
#Virtual Network DNS Servers. Set to an on prem DC initially.
#Separate with commas. Example: ["10.0.0.1", "10.0.0.2"]
landingzone_vnet_dns_servers = ["172.21.0.132", "172.21.0.133"]
#The prefix prepended to the name of the network security groups for each subnet
landingzone_NSG_Prefix = "NSG"

landingzone_vnet_tags = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }

#The name of the DC Subnet. This must be defined for the identity module
#MUST match one of the subnet names (Below)
landingzone_dcsubnet_name = "snet-dc-prod-cac-az"
#A list of subnets being added to the VNET
#Format: Name = ListOfSubnets
#Example: PrimarySubnet = ["10.0.0.0/24"]
#Example: SecondarySubnet = ["10.0.1.0/24","10.0.2.0/24"]
landingzone_subnets = {
  GatewaySubnet    = ["172.21.0.0/26"]
  AzureBastionSubnet    = ["172.21.0.64/26"]
  snet-fwpub-prod-cac-az  = ["172.21.1.128/26"]
  snet-fwpriv-prod-cac-az = ["172.21.1.192/26"]
  snet-fwmgm-prod-cac-az  = ["172.21.1.0/26"]
  snet-fwdiag-prod-cac-az = ["172.21.1.64/26"]
  snet-dc-prod-cac-az     = ["172.21.0.128/26"]
}

#Landing Zone Spoke Virtual Network

#Resource Group Name for Networking RG
spoke_resource_group_name = "rg-prod-cac-vnet-spoke"
#Virtual network Name
spoke_landingzone_vnet_name = "Vnet-prod-cac-az-spoke"
#Virtual Network address space. 
#Separate with commas. Example: ["10.0.0.0/16","10.0.1.0/16"]
spoke_landingzone_vnet_address_space = ["172.20.0.0/21"]
#Virtual Network DNS Servers. Set to an on prem DC initially.

#The name of the DC Subnet. This must be defined for the identity module
#MUST match one of the subnet names (Below)
#landingzone_dcsubnet_name = "snet-dc-prod-cac-az"
#A list of subnets being added to the VNET
#Format: Name = ListOfSubnets
#Example: PrimarySubnet = ["10.0.0.0/24"]
#Example: SecondarySubnet = ["10.0.1.0/24","10.0.2.0/24"]
spoke_landingzone_subnets = {
  #GatewaySubnet    = ["172.21.0.0/26"]
  #AzureBastionSubnet    = ["172.21.0.64/26"]
  snet-spoke-prod-cac-az  = ["172.20.1.0/24"]
}


#Identity (Domain Controllers)

#Whether or not to deploy the identity module. Set to 'true' to deploy.
deploy_identity = false

#Number of Domain Controllers
ident_dc_count = 1 #Allowed values are only 1 or 2.

#Important: If ident_dc_count(above) is set to 1, assigning values to all the below variables for DC VM2 and Availability Set are not required

#Username for Domain Controllers
ident_dc_admin_username = "azadmin"
#Password for Domain Controllers
ident_dc_admin_password = "TFSI@2021###3*"
#Storage Account for Boot Diagnostics for Domain Controllers name
ident_dcstore_bootdiag_name = "tfsivmbootdiag2021"

#Identity Resource Group name
ident_rg_name = "rg-prod-cac-dc"
ident_keyvault_name = "kv-prod-cac-01" 
#Name of the Recovery Services Vault for Identity Objects
ident_recoveryservicesvault_name = "rsv-dc-prod-cac-01"
#Whether 'Soft Delete' is enabled. Set to true for production
#If set to true, deleting the recovery services vault will fail until 7 days later.
ident_recoveryservicesvault_softdelete = false
#Name of the Availability Set for the domain controllers
ident_dcavailset_name = "avail-dc-prod-cac-01"
#Count of the Fault domain for the DC Availability Set
ident_dcavailset_fault_domain_count = 2
#Name of DC01 NIC Card
ident_dc01_nic_name = "nic-vm-prd-cac-dc1"
#Name of DC02 NIC Card 
ident_dc02_nic_name = "nic-vm-prd-cac-dc2"
#Static IP Address of DC01
ident_dc01_nic_ip = "172.21.0.132"
#Static IP Address of DC02
ident_dc02_nic_ip = "172.21.0.133"
#Name of DC01
ident_dc01_name = "vm-prd-cac-dc01"
#VM Size of DC01
ident_dc01_size = "Standard_D4_v3"
#Name of DC02
ident_dc02_name = "vm-prd-cac-dc02"
#VM Size of DC02
ident_dc02_size = "Standard_D4_v3"
#Name of the Backup Policy for Domain Controllers
ident_backup_policy_name = "DC_Backup_Policy"

ident_dcstore_bootdiag_tags = {
    CostCenter = "None"
    Enviroment = "production"
    Department = "IT"
}
ident_keyvault_tags = {
    CostCenter = "None"
    Enviroment = "production"
    Department = "IT"
}
ident_recoveryservicesvault_tags = {
    CostCenter = "None"
    Enviroment = "production"
    Department = "IT"
}

#Networking- VPN Gateway

#Whether or not the VPN Gateway module is deployed. Set to true to deploy.
deploy_gateway = false
#Name of VPN Gateway with gateway type: VPN
gtwy_vpn_name = "VPN_Gateway"
#Private Key (Secret) for VPN Gateway Connection
gtwy_connection_private_key = "TFSI@2021###3*"
#The Public IP address of the On-Premises VPN prodice (Supplied by customer)
gtwy_local_address = "75.97.167.55"
#The list of local address ranges for routing purposes - Separate with commas
gtwy_local_address_spaces = [
"192.168.1.0/24",
"192.168.2.0/24"
]
#The Gateway VPN Sku - Basic for Testing, but use Standard or better for production
gtwy_vpn_sku = "Basic"
#VPN Gateway Generation
gtyw_vpn_generation = "Generation1"
gtwy_vpn_tags = {
    CostCenter = "None"
    Enviroment = "production"
    Department = "IT"
}
gtwy_local_tags = {
    CostCenter = "None"
    Enviroment = "production"
    Department = "IT"
}

#Networking - Express Route

#Whether or not to deploy the express route module. Set to true to deploy.
deploy_expressroute = false
#Name of VPN Gateway with gateway type: ExpressRoute
expressroute_vpn_gtwy_name = "egw-prod-cac-01"
#Name of the Express Route Circuit
expressroute_circuit_name             = "erc-prod-cac-01"
#Service Provider - Customer Supplies
expressroute_circuit_service_provider = "Cologix"
#Peering Location - Custom Supplies
expressroute_circuit_peering_location = "Toronto"
#Bandwidth available on the express route circuit
expressroute_circuit_bandwidth        = 0.50
#Circuit SKU
expressroute_circuit_sku              = "Standard"
#Circuit Family
expressroute_circuit_family           = "MeteredData"

expressroute_gtwy_vpn_tags = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }

  expressroute_circuit_tags = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }
