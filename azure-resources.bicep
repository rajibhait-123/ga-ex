
param location string ='australiaeast'
param name string = 'StRs1'
param stogareName string = '${toLower(name)}${uniqueString(resourceGroup().id)}'

 

resource storageaccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: stogareName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
  properties: {
    accessTier: 'Hot'
  }
}
