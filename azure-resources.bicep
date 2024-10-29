
// param location string ='australiaeast'
// param stogareName string = 'testgastorage'
 
// resource storageaccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
//   name: stogareName
//   location: location
//   kind: 'StorageV2'
//   sku: {
//     name: 'Premium_LRS'
//   }
//   properties: {
//     accessTier: 'Hot'
//   }
// }

param location string = 'australiaeast'
param storageName string = 'haitstorage'
param namePrefix string = 'haitappser'

param dockerImage string = 'ubuntu/nginx' 
param dockerImageTag string = 'latest'

targetScope  = 'resourceGroup'

// how to consume modules

module storage 'modules/storage.bicep' = {
 name: storageName
 params: {
  storageName: storageName
  location: location
 }
}

module appPlanDeploy 'modules/servicePlan.bicep' = {
  name: '${namePrefix}-appPlanDeploy'
  params: {
    namePrefix: namePrefix
    location: location
  }
}

module deployWebsite 'modules/webApp.bicep' = {
  name: '${namePrefix}-deploy-website'
  params: {
    location: location
    appPlanId: appPlanDeploy.outputs.planId
    dockerImage: dockerImage
    dockerImageTag: dockerImageTag
  }
}

output siteUrl string = deployWebsite.outputs.siteUrl
