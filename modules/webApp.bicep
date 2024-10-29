param namePrefix string = 'hait'
param location string = 'australiaeast'
param appPlanId string

param dockerImage string = 'ubuntu/nginx'
param dockerImageTag string = 'latest'

resource webApplication 'Microsoft.Web/sites@2023-12-01' = {
  name: '${namePrefix}-site'
  location: location
  properties: {
    serverFarmId: appPlanId
    //httpsOnly: true
    siteConfig: {
      appSettings: [
        {
          name: 'DOCKER_REGISTRY_SERVICE_URL'
          value: 'https://index.docker.io'
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_USERNAME'
          value: ''
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_PASSWORD'
          value: ''
        }
        {
          name: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE'
          value: 'false'
        }
      ]
      linuxFxVersion: 'DOCKER|${dockerImage}:${dockerImageTag}'
      // Additional Web App configurations
    }
  }
}

output siteUrl string = webApplication.properties.hostNames[0]
