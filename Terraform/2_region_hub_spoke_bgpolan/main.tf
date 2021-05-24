# Azure Transit Module East

module "azure-transit-firenet" {
  source  = "terraform-aviatrix-modules/azure-transit-firenet/aviatrix"
  version = "3.0.4"
  name                   = var.name1
  instance_size          = var.instance_size
  ha_gw                  = var.ha_enabled
  cidr                   = var.azure_transit_cidr1
  region                 = var.azure_region1
  account                = var.azure_account_name
  firewall_image         = var.firewall_image
  firewall_image_version = var.firewall_image_version
  attached				       = var.firewall_attached
  firewall_username		   = var.firewall_username
  active_mesh			       = var.active_mesh
  bootstrap_storage_name = var.bootstrap_storage_name
  storage_access_key     = var.storage_access_key
  file_share_folder      = var.file_share_folder
  local_as_number		     = var.local_as_number1
  az_support			       = var.az_support
  az1				             = var.az1
  az2				             = var.az2
  enable_bgp_over_lan    = var.enable_bgp_over_lan
}

module "transit_azure_1" {
  source                 = "terraform-aviatrix-modules/azure-transit/aviatrix"
  version                = "4.0.0"
  name                   = var.name2
  instance_size          = var.instance_size
  ha_gw                  = var.ha_enabled
  cidr                   = var.azure_transit_cidr2
  region                 = var.azure_region2
  account                = var.azure_account_name
  local_as_number		     = var.local_as_number2
  az_support			       = var.az_support
  az1				             = var.az1
  az2				             = var.az2
}


#Azure Spokes
module "azure-spoke1" {
  for_each				 = var.azure_vm_spokes1
  source           = "terraform-aviatrix-modules/azure-spoke/aviatrix"
  version          = "4.0.0"
  name					   = each.key
  cidr 				 	   = each.value
  region 				   = var.azure_region1
  account				   = var.azure_account_name
  ha_gw					   = false
  instance_size		 = var.instance_size_spokes
  active_mesh			 = var.active_mesh
  attached				 = var.attached_spoke
  az_support			 = var.az_support
  az1					     = var.az1
  az2					     = var.az2
  transit_gw			 = module.azure-transit-firenet.transit_gateway.gw_name
}

module "azure-spoke2" {
  for_each				 = var.azure_vm_spokes2
  source  = "terraform-aviatrix-modules/azure-spoke/aviatrix"
  version = "4.0.0"
  name					 = each.key
  cidr 				 	 = each.value
  region 				 = var.azure_region2
  account				 = var.azure_account_name
  ha_gw					 = false
  instance_size			 = var.instance_size_spokes
  active_mesh			 = var.active_mesh
  attached				 = var.attached_spoke
  az_support			 = var.az_support
  az1					     = var.az1
  az2					     = var.az2
  transit_gw			 = module.transit_azure_1.transit_gateway.gw_name
}

#resource "aviatrix_transit_gateway_peering" "transit_gateway_peering_1" {
#    transit_gateway_name1 = var.name1
#    transit_gateway_name2 = var.name2
#    enable_peering_over_private_network = false
#}
