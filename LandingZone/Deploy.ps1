[CmdletBinding()]
param (
    # What type of deployment you want to do
    [ValidateSet("1", "2", "3", "All")]
    [string]
    $Tiers = "All"
)

#Force Re-auth due to token timeouts.
$null = az logout 
$null = az login

$platform_sub_id = ""
$landing_zone_sub_ids = [System.Collections.ArrayList]@()

$Config = Resolve-Path ".\Configuration\config.tfvars"
$lzConfig = Resolve-Path ".\Configuration\landingzone1.tfvars"

$StartMS = Get-Date

if ($Tiers.Equals("1") -or $Tiers.Equals("All")) {
    Write-Output "Tier 1 - Platform Deployment:"

    Write-Output "Your Subscriptions:"
    $subs = az account list | ConvertFrom-Json
    $subs | Select-Object Name, Id | Format-Table
    $target_sub = Read-Host -Prompt "Input the subscription id to be used"
    $target_sub = az account show -s $target_sub | ConvertFrom-Json

    $confirmation = Read-Host -Prompt "You want to deploy platform resources to $($target_sub.name) - $($target_sub.id)? (y/n)"

    if ($confirmation.Equals("y")) {
        az account set -s $target_sub.id
        $platform_sub_id = $target_sub.id

        $input = Read-Host -Prompt "Please enter the Landing Zone Config file path (leave blank for $($Config))"

        if ($input) {
            $Config = Resolve-Path $input
        }

        Set-Location ./Infrastructure/Tier1
        terraform init
        terraform apply -var-file $Config -auto-approve
        Set-Location ..\..\
    }
    else {
        exit
    }    
}
if ($Tiers.Equals("2") -or $Tiers.Equals("All")) {
    $continue = $true
    while ($continue) {

        Write-Output "Tier 2 - Landing Zone Deployment:"

        if (!$platform_sub_id) {
            $continue = $true
            while ($continue) {
                Write-Output "Landing Zone Deployments require Platform Subscriptions to be deployed:"
                Write-Output "Your Subscriptions:"
                $subs = az account list | ConvertFrom-Json
                $subs | Select-Object Name, Id | Format-Table
                $target_sub = Read-Host -Prompt "Input the subscription id to be used"
                $target_sub = az account show -s $target_sub | ConvertFrom-Json

                $confirmation = Read-Host -Prompt "You are using this subscription for platform resources? $($target_sub.name) - $($target_sub.id) (y/n)"

                if ($confirmation.Equals("y")) {
                    $platform_sub_id = $target_sub.id
                    $continue = $false
                }
            }
        }

        Write-Output "Select your Landing Zone Deployment Subscription:"
        Write-Output "Your Subscriptions:"
        $subs = az account list | ConvertFrom-Json
        $subs | Select-Object Name, Id | Format-Table
        $target_sub = Read-Host -Prompt "Input the subscription id to be used"
        $target_sub = az account show -s $target_sub | ConvertFrom-Json

        $confirmation = Read-Host -Prompt "You want to deploy landing zone resources to $($target_sub.name) - $($target_sub.id)? (y/n)"

        if ($confirmation.Equals("y")) {
            $null = az account set -s $target_sub.id
            $landing_zone_sub_ids.Add($target_sub.id) | Out-Null

            $input = Read-Host -Prompt "Please enter the general Config file path (leave blank for $($Config))"

            if ($input) {
                $Config = Resolve-Path $input
            }

            $input = Read-Host -Prompt "Please enter the Landing Zone Config file path (leave blank for $($lzConfig))"

            if ($input) {
                $lzConfig = Resolve-Path $input
            }
            Set-Location ./Infrastructure/Tier2
            terraform init
            terraform apply -var-file $Config -var-file $lzConfig -var platform_sub_id="$($platform_sub_id)" -auto-approve
            Set-Location ..\..\
        }

        $input = Read-Host -Prompt "Deploy another Landing Zone? (y/n)"

        if ($input.Equals("n")) {
            $continue = $false
        }
    }
}
if ($Tiers.Equals("3") -or $Tiers.Equals("All")) {
    Write-Output "Tier 3 - Management/Policies Deployment:"

    Write-Output "Your Subscriptions:"
    $subs = az account list | ConvertFrom-Json
    $subs | Select-Object Name, Id | Format-Table
    $target_sub = Read-Host -Prompt "Input the subscription id to be used"
    $target_sub = az account show -s $target_sub | ConvertFrom-Json

    $confirmation = Read-Host -Prompt "You want to deploy managment groups/policy resources to $($target_sub.name) - $($target_sub.id)? (y/n)"

    if ($confirmation.Equals("y")) {
        az account set -s $target_sub.id

        $input = Read-Host -Prompt "Please enter the management config file path (leave blank for $($Config))"

        if ($input) {
            $Config = Resolve-Path $input
        }

        Set-Location ./Infrastructure/Tier3
        terraform init
        terraform apply -var-file $Config -auto-approve
        Set-Location ..\..\
    }
    else {
        exit
    }
}
$EndMs = Get-Date
Write-Output "Completed in $(($EndMs - $StartMS).TotalMinutes) minutes"