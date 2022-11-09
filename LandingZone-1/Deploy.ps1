.\Login.ps1

$landingZoneSubzcriptionID = "3e96e598-99b1-4f61-8b48-8a66790f3cd0"

$Config = Resolve-Path ".\config.tfvars"

$StartMS = Get-Date

Write-Host "Deploying Landing Zone"

$null = az account set -s $landingZoneSubzcriptionID

Write-Host "###### Context Setting Complete ######"

terraform init

Write-Host "###### Teraform Initialization Complete ######"

terraform apply -var-file $Config -auto-approve

Write-Host "###### Teraform Apply Complete ######"

$EndMs = Get-Date
Write-Output "Completed in $(($EndMs - $StartMS).TotalMinutes) minutes" S