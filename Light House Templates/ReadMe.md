# Templates in these directory is to on-board to Light house
PREREQUESITE:
- The tenant ID of the service provider's tenant (where you will be managing the customer's resources).
- The tenant ID of the customer's tenant (which will have resources managed by the service provider).
- The subscription IDs for each specific subscription in the customer's tenant that will be managed by the service provider (or that contains the resource group(s) that will be managed by the service provider).
- The Microsoft.ManagedServices resource provider should be registered for the customer subscription.
- Download the templates on local system for manual deployment using Azure CLI or Powershell.
- Login to Azure portal with Owner role


## Using Azure Powerhsell:
- Download and install the Azure powershell 
- Log in first with Connect-AzAccount if you're not using Cloud Shell

## Deploy Azure Resource Manager template using template and parameter file locally
New-AzSubscriptionDeployment -Name <deploymentName> -Location <AzureRegion> -TemplateFile <pathToTemplateFile> -TemplateParameterFile <pathToParameterFile>        -Verbose

## Deploy Azure Resource Manager template that is located externally or in Github
New-AzSubscriptionDeployment -Name <deploymentName> -Location <AzureRegion> -TemplateUri <templateUri> -TemplateParameterUri <parameterUri> -Verbose


## Onbording customer subscription to Azure light house

1. Deploy the this template to onabord subscription to MSP
[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fkulbirsj%2FAzure-Light-House%2Fmain%2FLight%20House%20Templates%2FOnboard%2FSusbcriptiondelegatedResourceManagement.json)


2. Deploy this template to onboard resource group to MSP
[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fkulbirsj%2FAzure-Light-House%2Fmain%2FLight%2520House%2520Templates%2FOnboard%2FRG.json)


3. Deploy this template to onboard Multiple resource groups to MSP
[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fkulbirsj%2FAzure-Light-House%2Fmain%2FLight%2520House%2520Templates%2FOnboard%2FMultiRG.json)


### Enabling Policies with Azure light house

1. This template deploys an Azure Policy that will audit for delegation assignments.
[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fkulbirsj%2FAzure-Light-House%2Fmain%2FLight%2520House%2520Templates%2FPolicies%2FAuditdelegation.json)

2. This template deploys the azure policy that will create & modify tags.
[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fkulbirsj%2FAzure-Light-House%2Fmain%2FLight%2520House%2520Templates%2FPolicies%2Fenforcetags.json)


3. This template deploys the azure policy that will restrict the managing tenant id on the subscription.
[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fkulbirsj%2FAzure-Light-House%2Fmain%2FLight%2520House%2520Templates%2FPolicies%2FAllowedManagingTenantID.json)

