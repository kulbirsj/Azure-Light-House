.\Login.ps1

$landingZoneSubzcriptionID = "3e96e598-99b1-4f61-8b48-8a66790f3cd0"

Write-Host "Destroying Landing Zone"

$null = az account set -s $landingZoneSubzcriptionID

Write-Host "###### Context Setting Complete ######"

$Config = Resolve-Path ".\config.tfvars"

$StartMS = Get-Date


terraform destroy -var-file $Config -auto-approve

Write-Host "###### Teraform Destroy Complete ######"

$EndMs = Get-Date
Write-Output "Completed in $(($EndMs - $StartMS).TotalMinutes) minutes"
