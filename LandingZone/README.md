# Must be installed to Use this tool

- Azure Cli https://docs.microsoft.com/en-us/cli/azure/install-azure-cli
- Terraform https://learn.hashicorp.com/tutorials/terraform/install-cli

You  can use the following if you have chocolatey installed [Chocolatey](https://chocolatey.org/install)

```pwsh

choco install azure-cli terraform

```

## Deploying

There are two methods available to deploy the landing zones. Either deploy all three tiers with a single script, or deploy each tier individually.

### Deploy All Tiers

1. Edit the configuration files in the `Configuration` folder to the customer specifications. (See: Configuration Details section below)
2. While in powershell, in this directory, run `Deploy.ps1`
3. A browser window will open automatically - login to the Azure Portal with a Global Admin account.  Close the browser window once authentication is successful.
4. (Back in the powershell window) Ensure the subscription displayed is the correct one. If so enter 'yes' at the prompt. If not enter the appropriate subscription id.
5. Deployment will proceed. You Will be prompted to select a subscription for the landing zone. Monitor output in the powershell window until tier 3 deployment completes.
6. You will be prompted to authenticate for each landingzone that you want to deploy, ensure that you are using the correct subscriptions.
6. Check if everything is deployed as expected in the portal.

### Deploy Individual Tiers

1. Edit the configuration files in the `Configuration` folder to the customer specifications. (See: Configuration Details section below)
2. While in powershell, in this directory, run `Deploy.ps1 -Tiers #`
3. A browser window will open automatically - login to the Azure Portal with a Global Admin account.  Close the browser window once authentication is successful.
4. (Back in the powershell window) Ensure the subscription displayed is the correct one. If so enter 'yes' at the prompt. If not enter the appropriate subscription id.
5. Deployment will proceed. You Will be prompted to select a subscription for the landing zone. Monitor output in the powershell window until tier 3 deployment completes.
6. You will be prompted to authenticate for each landingzone that you want to deploy, ensure that you are using the correct subscriptions.
6. Check if everything is deployed as expected in the portal.

## Configuration Details

The config.tfvars file in the Configuration folder **must** be modified prior to deployment, and is the only file that should be modified. No other file modifications are necessary or supported.

### Configuration File Sections
The config.tfvars file is broken into sections, aligning to the different tiers. Each variable in this file represents a configuration of a resource. For example, the 'location' varible in Tier 1 determines which Azure Region the virtual network will be deployed to. The 'platform_vnet_name' will be the name of the virtual network. Most azure resources will need to be destroyed and re-created to change the names, so carefully choose your options prior to running the deployment.

### Optional Deployments

Some components are optional to deploy. One example is the Identity Module, which deploys
Domain Controllers, a Key Vault, and Backups. These modules have their own sub-sections in the config.tfvars file. In addition, there is a 'deploy_XXX' variable that determines whether this module will be deployed.  If false, the entire module is skipped.

*Example:*
Tier 1 - Identity section
deploy_identity = true

Set the above variable to false to skip the deployment of the entire Identity module (detailed below)

## FAQ

- I downloaded the zip and it doesn't work!
    - Check that you have the appropriate requirements installed, the program needs both terraform and az to be accessible commands.

## Azure Landing Zone Tiers

The tiers below are designed to be deployed to a given subscription that is already created. While we will create automation to provision the initial management groups, their policies, and the Azure AD Groups, we would not be facilitating the creation of new subscription through Terraform. It may be difficult or impossible to provision a new CSP subscription using Terraform and would require that an engineer have a slightly different flow chart for those engagements. 

- Tier 1 - This tier will provision the resources required for a Platform subscription. The premise is that an engineer will be able to point Terraform to an existing subscription and deploy a configuration that creates a hub Virtual network for the landing zones to connect to. 
- Tier 2 - This can be used to deploy any number of Landing Zone subscriptions.  Each landing zone will contain a Virtual Network that is peered back to the platform virtual network created in Tier 2.This should happen automatically when a new Landing Zone is provisioned within the customers environment due to how Terraform handles variables.
- Tier 3 - This tier will provision the management groups under the Tenant Root group. It will assign the required policies and Azure AD Groups aligned with those management groups and customer decisions.

### Tier 1
Tier 1 will contain the required resources that would be deployed to Platform. In some instances, we may choose to push these resources into a single subscription for smaller customers.

#### Platform
An Azure subscription dedicated for management, connectivity, security, and identity.

* Azure Security Center
    * Free
    * Paid
* Log Analytics Workspaces
    * Diagnostics settings for Activity Logs, VMs, and PaaS resources sent to Log Analytics
    * NSG Flow Logs
* Automation Accounts
* Platform Virtual Network
    * Gateway Subnet
    * ADDS Subnet
    * Firewall Subnet
    * Bastion Subnet
* Site Connectivity
    * Azure VPN Gateway
        * Site-to-Site
        * Express Route
    * Express Route
    * Azure WAN
    * VNET Peering
* Identity
    * Domain Controllers
        * DNS Configuration
    * Recovery Vault **Backups**
        * ADDS Backups should be kept separate from other backups
    * Key Vault
        * Deployed even if not needed
    * Storage Account
        * Boot Diagnostics

### Tier 2
Tier 2 will contain the required resources that would be deployed to a Landing Zone. In some instances, we may choose to push these resources into a single subscription for smaller customers.

#### Landing Zone
An Azure Subscription(s) for Applications that are deployed to the customer environment.

* Networking
    * Application VNET
    * Network Security Groups
    * Route Table
    * VNET Peering
* Recovery Services
    * Recovery Vault
        * Backup
        * Site Recovery

### Tier 3

#### Management Groups
* Customer
* Platform
* Landing Zone

#### RBAC
##### Azure AD Groups
* Populate Management Groups
    * Contributor
    * Owner
    * Reader
    * Billing Reader

#### Policy
* Azure Security monitoring
* Azure Security Center **Standard or Free tier**
* Diagnostics settings for Activity Logs, VMs, and PaaS resources sent to Log Analytics
* Enforce VM in-guest monitoring **Windows & Linux**
* Enforce Backup for all virtual machines **Windows & Linux** by deploying a recovery services vault in the same location and resource group as the virtual machine
* Prevent inbound RDP from Internet
* Ensure subnets are associated with NSG
* Prevent IP forwarding
* Enforce encryption for Azure SQL
* Enforce auditing for Azure SQL
* Enforce secure access **HTTPS** to storage accounts
* Allowed Azure Region for Resources and Resource Groups
* Allowed Storage Account SKUs **choose while deploying**
* Allowed Azure VM SKUs **choose while deploying**
* Require Network Watcher to be deployed
* Require Azure Storage Account Secure transfer Encryption
* Deny resource types **choose while deploying**
* Append a Tag and its value to resource
* Append a Tag and its value on resource groups
* Inherit a Tag from Subscription if missing
* Inherit a Tag from Resource Group
* Deploy Network Watcher when Virtual network is deployed
