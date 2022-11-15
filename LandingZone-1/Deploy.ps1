.\Login.ps1

$landingZoneSubzcriptionID = "773c2382-4ca2-4547-8889-14bd1d86df9d"

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