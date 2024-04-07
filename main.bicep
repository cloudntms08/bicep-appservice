param location string = 'east us'
param webappname string 


resource webappplan 'Microsoft.Web/serverfarms@2023-01-01' = {
  name: 'ntmswebapp91'
  location: location
  sku : {
    name: 'S1'
  }
}

resource webapp 'Microsoft.Web/sites@2023-01-01' = {
  name: '${webappname}${uniqueString(resourceGroup().id)}'
  location:location
  properties: {
    serverFarmId: webappplan.id
  }
}

resource slot1 'Microsoft.Web/sites/slots@2023-01-01' = {
  parent: webapp
  name: 'feature1'
  location: location
  properties: {
    serverFarmId: webappplan.id
    cloningInfo: {
      sourceWebAppId: webapp.id
    }
}

}
