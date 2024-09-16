module "application_gateway" {
  source = "../../Jewelers-modules/network/app_gateway"
  name = var.app_gateway_name
  location = var.location
  tags= var.tags
  rg_name = var.rg_name
  subnet_id = data.subnet.id
  sku_name = var.sku_name
  sku_tier = var.sku_tier
  private_ip_address = var.private_ip_address
  
}