$resGroup = 'FabMedicalWorkshop'
$acrName = 'rissFabMedContainerReg'
$aksName = 'rissFabMedAks'
$cosmosAccName = 'rissfabmedcosmos' #Note: Must be all lower case letters

az login --use-device-code

##Note: defaults to location of resource group
az acr create --resource-group $resGroup --name $acrName --sku basic
az aks create --resource-group $resGroup --name $aksName --node-count 2 --enable-addons monitoring --generate-ssh-keys
az cosmosdb create --resource-group $resGroup --name $cosmosAccName --kind MongoDB