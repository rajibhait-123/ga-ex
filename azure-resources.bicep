
param location string ='australiaeast'
param stogareName string = 'ga-storage'
 

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
