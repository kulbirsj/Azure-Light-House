az logout
az login

$sub = az account show | ConvertFrom-Json

$confirmation = Read-Host -Prompt "Terraform will be destroying all infrastructure it manages on this subscription: $($sub.name) - $($sub.id), is this correct?(only 'yes' will go foward)"

$Config = Resolve-Path .\Configuration\config.tfvars

if ($confirmation.Equals("yes")) {
    $StartMS = Get-Date
    Set-Location ./Infrastructure/Tier3
    Write-Output "Destroying Tier 3"
    terraform destroy -var-file $Config -auto-approve
    Set-Location ../Tier2
    Write-Output "Destroying Tier 2"
    terraform destroy -var-file $Config -auto-approve
    Set-Location ../Tier1
    Write-Output "Destroying Tier 1"
    terraform destroy -var-file $Config -auto-approve
    Set-Location ../../
    $EndMs = Get-Date
    Write-Output "Completed in $(($EndMs - $StartMS).TotalMinutes) minutes"
}
else {
    Write-Output "Aborted."
}