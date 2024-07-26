resource_group_name = "h-cus-rg-privatednszones"
location            = "centralus"
vnet_id             = "/subscriptions/3a5271d7-a7d6-4584-818c-238fa6355819/resourceGroups/h-cus-rg-hub/providers/Microsoft.Network/virtualNetworks/h-cus-vnet-hub"
subscriptionid      = "3a5271d7-a7d6-4584-818c-238fa6355819"

tags = {
  Applications  = "Private DNS Zones"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "06/24/2024"
  Department    = "IT"
  Description   = "Private DNS Zones"
  DisplayName   = "Private DNS Zones"
  Environment   = "Production Hub"
  Tier          = "1"
}

dns_zones = [
  "privatelink.blob.core.windows.net",
  "privatelink.file.core.windows.net",
  "privatelink.queue.core.windows.net",
  "privatelink.table.core.windows.net",
  "privatelink.database.windows.net",
  "privatelink.sql.azuresynapse.net",
  "privatelink.documents.azure.com",
  "privatelink.gremlin.azure.com",
  "privatelink.cassandra.azure.com",
  "privatelink.table.cosmos.azure.com",
  "privatelink.mongo.cosmos.azure.com",
  "privatelink.mysql.database.azure.com",
  "privatelink.postgres.database.azure.com",
  "privatelink.mariadb.database.azure.com",
  "privatelink.vaultcore.azure.net",
  "privatelink.managedhsm.azure.net",
  "privatelink.azurecr.io",
  "privatelink.azurewebsites.net",
  "privatelink.scm.azurewebsites.net",
  "privatelink.cognitiveservices.azure.com",
  "privatelink.oms.opinsights.azure.com",
  "privatelink.ods.opinsights.azure.com",
  "privatelink.agent.azconfig.io",
  "privatelink.redis.cache.windows.net",
  "privatelink.servicebus.windows.net",
  "privatelink.eventgrid.azure.net",
  "privatelink.signalr.azure.com",
  "privatelink.workspace.azureml.ms",
   "aca-dev.jmcloudapps.com",
  "aca-prod.jmcloudapps.com",
  "aca-staging.jmcloudapps.com",
  "aca-test.jmcloudapps.com",
  "aca-training.jmcloudapps.com",
  "aseilb.jewelersmutual.com",
  "dev-aseilb.jewelersmutual.com",
  "graysky-267338cf.centralus.azurecontainerapps.io",
  "lemonplant-d3971365.centralus.azurecontainerapps.io",
  "mongodb.dev-platform.jewelersmutual.com",
  "privatelink.prod.migration.windowsazure.com",
  "qa-aseilb.jewelersmutual.com",
  "scm.azure-api.net",
  "scm.privatelink.azurewebsites.net",
  "training-aseilb.jewelersmutual.com",
  "uat-aseilb.jewelersmutual.com",
  "uat2-aseilb.jewelersmutual.com",
  "whiteisland-f5877e78.centralus.azurecontainerapps.io"
  
  
]

