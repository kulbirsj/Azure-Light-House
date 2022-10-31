# Azure-Light-House
Azure_LightHouse

## AzureLightHouseDemo.ps1 
1. It is a script to automate the parameter values as variables in the script file 
2. Downloading the template files from github repo to local system & run deploy Azure Resource Manager template using template and parameter file locally
3. Update the variables in the script:

    - $PathToTemplateFiles = Where the JSON files used to configure lighthouse will be saved locally
    - $CustomerSubscriptionId = the subscription ID of your “Customer” subscription. Aka, the subscription that will be managed
    - $SubscriptionName = The display name of the managing subscription that will eventually manage many resources from multiple customers
    - $AdminGroup = The name of the Azure AD admin group in the in the Managed Service Provider (MSP) or Managing tenant.
    - $AdminGroupMember = User account you’d like to add to the group. You can leave this blank if your group is already set up and populated
    - $MSPOfferName =The name you want to appear in the customers lighthouse portal under Service Provider Offers. This must be unique.
