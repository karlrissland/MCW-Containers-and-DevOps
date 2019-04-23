$resGroup = 'FabMedicalWorkshop'
$acrName = 'rissFabMedContainerReg'
$aksName = 'rissFabMedAks'
$cosmosAccName = 'rissFabMedCosmos'
$cosmoslocation = 'East US'

az login --use-device-code
az acr create --resource-group $resGroup --name $acrName --sku basic
az akd create --resource-group $resGroup --name $aksName --node-count 2 --enable-addons monitoring --generate-ssh-keys
az cosmosdb create --resource-group $resGroup --name $cosmosAccName --kind MongoDB --locations $cosmoslocation