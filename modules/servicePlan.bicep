param namePrefix string
param location string = resourceGroup().location
param sku string = 'F1'

resource appServicePlan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: '${namePrefix}-website'
  location: location
  kind: 'ubuntu'
  sku: {
    name: sku
  }
  // properties: {
  //   reserved: true
  // }
}

output planId string = appServicePlan.id
