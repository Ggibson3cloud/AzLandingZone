locals {
  dns_zone_name = toset([each.key])
}