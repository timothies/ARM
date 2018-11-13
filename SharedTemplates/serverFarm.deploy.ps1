
### Define Deployment Variables
$location = 'southeastasia'
$resourceGroupName = 'nested-test'
$resourceDeploymentName = $resourceGroupName + '-deployment'
$templateFile = 'serverFarm.json'
$template = $PWD.Path + '\' + $templateFile

### Create Resource Group
function Initialize-ResourceGroup {
    New-AzureRmResourceGroup `
        -Name $resourceGroupName `
        -Location $location `
        -Verbose -Force
}

### Check deploy is valid
function Test-Deployment {
    Test-AzureRmResourceGroupDeployment `
        -ResourceGroupName $resourceGroupName `
        -TemplateFile $template -Verbose
}

### Deploy Resources with default Params
function New-Deployment {
    New-AzureRmResourceGroupDeployment `
        -Name $resourceDeploymentName `
        -ResourceGroupName $resourceGroupName `
        -TemplateFile $template `
        -Verbose -Force
}
    
### Cleanup Resources
function Remove-Assests {
    Remove-AzureRmResourceGroup -Name $resourceGroupName -Force
}

# Remove-Assests
Initialize-ResourceGroup;
New-Deployment;