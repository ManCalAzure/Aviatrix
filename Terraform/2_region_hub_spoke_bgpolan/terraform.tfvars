// Modify values below as needed
# Aviatrix Controller
#controller_ip = "REPLACE_ME"
#username      = "REPLACE_ME"
#password      = "REPLACE_ME"

# Azure Access Account Name defined in Controller
azure_account_name = "avx-sp-acct" # Replace this with your Access Account name
# HA flags
ha_enabled  = false
name1       = "EAST-T"

# Aviatrix Gateway size
instance_size = "Standard_D3_v2" # "Standard_F32s_v2" 
instance_size_spokes = "Standard_B2ms"

# Test VM Kit
#test_instance_size = "Standard_DS4_v2" # "Standard_F32s_v2" 

# NGFW
firewall_image         = "Palo Alto Networks VM-Series Next-Generation Firewall Bundle 1"
firewall_image_version = "9.1.0"
firewall_size          = "Standard_D3_v2"
firewall_username	   = "lab-user"
password			   = "Ahina88f!!!!"
firewall_attached	   = "true"


# Transit Gateway Network Variables
// Transit East
azure_transit_cidr1   = "10.0.0.0/16"
azure_transit_cidr2   = "10.10.0.0/16"
azure_region1         = "East US"
azure_region2         = "West US 2"
active_mesh			  = "true"

// Spokes
azure_vm_spokes1 = { "SPK1-E" = "10.100.0.0/16" }
azure_vm_spokes2 = { "SPK1-W" = "10.101.0.0/16" }

attached_spoke 	 = "false"
az_support       = "true"

#Firewall Bootstrap

file_share_folder	        = "palobootstrap"
bootstrap_storage_name      = "mcbootstrap"
storage_access_key	        = "4Vq7PpgqQfqKweBLCQ9AdAJRqg7KQV7hYXFXbmb70cX8hvQQLgqLAkYXEH0nBPb/BBAO1PkXmsQ4p4KdrK7gdQ=="

#Transit BGP ASN & AZs
local_as_number1			 = "65010"
local_as_number2			 = "65011"
az1						     = "az-1"
az2						     = "az-2"
enable_bgp_over_lan          = "true"