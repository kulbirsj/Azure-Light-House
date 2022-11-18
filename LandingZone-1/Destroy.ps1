.\Login.ps1

$landingZoneSubzcriptionID = "773c2382-4ca2-4547-8889-14bd1d86df9d"

Write-Host "Destroying Landing Zone"

$null = az account set -s $landingZoneSubzcriptionID

Write-Host "###### Context Setting Complete ######"

$Config = Resolve-Path ".\config.tfvars"

$StartMS = Get-Date


terraform destroy -var-file $Config -auto-approve

Write-Host "###### Teraform Destroy Complete ######"

$EndMs = Get-Date
Write-Output "Completed in $(($EndMs - $StartMS).TotalMinutes) minutes"
