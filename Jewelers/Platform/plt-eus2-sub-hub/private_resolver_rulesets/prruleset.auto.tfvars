location                    = "centralus"
resource_group_name         = "h-cus-rg-privatednszones"
dns_forwarding_ruleset_name = "h-cus-ruleset-forwarding"
outbound_endpoint_id        = "/subscriptions/3a5271d7-a7d6-4584-818c-238fa6355819/resourceGroups/h-cus-rg-privatednsresolver/providers/Microsoft.Network/dnsResolvers/h-cus-dnspr-dns01/outboundEndpoints/h-cus-ep-dns01out"
subscriptionid              = "3a5271d7-a7d6-4584-818c-238fa6355819"

tags = {
  Applications  = "Private DNS Zones"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "07/19/2024"
  Department    = "IT"
  Description   = "Private DNS Zones"
  DisplayName   = "Private DNS Zones"
  Environment   = "Production Hub"
  Tier          = "1"
}


dns_forwarding_rules = {
  "apijewelersmutualcom" = {
    domain_name        = "api.jewelersmutual.com."
    target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
  },
   "certauthfsjminsurecom" = {
     domain_name        = "certauth.fs.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "cisco-internaljminsurecom" = {
     domain_name        = "cisco-internal.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "citrixjminsurecom" = {
     domain_name        = "citrix.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "citrixeqcjminsurecom" = {
     domain_name        = "citrixeqc.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "devjewelersntlocal" = {
     domain_name        = "dev.jewelersnt.local."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "DevOpsDevopsTestcom" = {
     domain_name        = "DevOps.DevopsTest.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "enterpriseregistrationjminsurecom" = {
     domain_name        = "enterpriseregistration.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "eqcstorefrontjminsurecom" = {
     domain_name        = "eqcstorefront.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "fsjminsurecom" = {
     domain_name        = "fs.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "holojemcom" = {
     domain_name        = "holojem.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "idpdev1testjewelersmutualcom" = {
     domain_name        = "idp.dev1.testjewelersmutual.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "jewelersntlocal" = {
     domain_name        = "jewelersnt.local."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "jm-p-ldaps001jminsurecom" = {
     domain_name        = "jm-p-ldaps001.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "k2devjminsurecom" = {
     domain_name        = "k2dev.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "k2farmjminsurecom" = {
     domain_name        = "k2farm.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "loginjminsurecom" = {
     domain_name        = "login.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "managejewelersmutualcom" = {
     domain_name        = "manage.jewelersmutual.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "manageperfectcircleinsurancecom" = {
     domain_name        = "manage.perfectcircleinsurance.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "managetestjewelersmutualcom" = {
     domain_name        = "manage.testjewelersmutual.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "myjewelersmutualcom" = {
     domain_name        = "my.jewelersmutual.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "mytestjewelersmutualcom" = {
     domain_name        = "my.testjewelersmutual.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "mytrainingjewelersmutualcom" = {
     domain_name        = "my.training.jewelersmutual.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "owajminsurecom" = {
     domain_name        = "owa.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "policycenterjewelersmutualcom" = {
     domain_name        = "policycenter.jewelersmutual.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "polycomjminsurecom" = {
     domain_name        = "polycom.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "producerengagejewelersmutualcom" = {
     domain_name        = "producerengage.jewelersmutual.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "producerengagetestjewelersmutualcom" = {
     domain_name        = "producerengage.testjewelersmutual.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "producerengagetrainingjewelersmutualcom" = {
     domain_name        = "producerengage.training.jewelersmutual.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "quarantinejminsurecom" = {
     domain_name        = "quarantine.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "resetjminsurecom" = {
     domain_name        = "reset.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "sfjminsurecom" = {
     domain_name        = "sf.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "sftpjminsurecom" = {
     domain_name        = "sftp.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "s-policycenterjewelersmutualcom" = {
     domain_name        = "s-policycenter.jewelersmutual.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "sponsorjminsurecom" = {
     domain_name        = "sponsor.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "sqllocal" = {
     domain_name        = "sql.local."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "stagejewelersntlocal" = {
     domain_name        = "stage.jewelersnt.local."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "t15-policycenterjewelersmutualcom" = {
     domain_name        = "t15-policycenter.jewelersmutual.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "t4-policycenterjewelersmutualcom" = {
     domain_name        = "t4-policycenter.jewelersmutual.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "tableaujminsurecom" = {
     domain_name        = "tableau.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "tableautestjminsurecom" = {
     domain_name        = "tableautest.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "testjewelersntlocal" = {
     domain_name        = "test.jewelersnt.local."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "test001jminsurecom" = {
     domain_name        = "test001.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "test002jminsurecom" = {
     domain_name        = "test002.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "test003jminsurecom" = {
     domain_name        = "test003.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "test004jminsurecom" = {
     domain_name        = "test004.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "test-apijewelersmutualcom" = {
     domain_name        = "test-api.jewelersmutual.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "timejminsurecom" = {
     domain_name        = "time.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "trainingjewelersntlocal" = {
     domain_name        = "training.jewelersnt.local."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "transferjminsurecom" = {
     domain_name        = "transfer.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "visixjminsurecom" = {
     domain_name        = "visix.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "voicejminsurecom" = {
     domain_name        = "voice.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "wysejminsurecom" = {
     domain_name        = "wyse.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   },
   "xendesktopjminsurecom" = {
     domain_name        = "xendesktop.jminsure.com."
     target_dns_servers = ["10.120.0.70:53", "10.120.0.69:53"]
   }
}



vnets = {
  vnet1 = "/subscriptions/3a5271d7-a7d6-4584-818c-238fa6355819/resourceGroups/h-cus-rg-hub/providers/Microsoft.Network/virtualNetworks/h-cus-vnet-hub"
   ##Add more VNets as needed
}