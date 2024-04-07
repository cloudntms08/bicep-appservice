param location string = 'east us'


resource webappplan 'Microsoft.Web/serverfarms@2023-01-01' = {
  name: 'ntmswebapp91'
  location: location
  sku : {
    name: 'S1'
  }
}
