variable "username" {
  type    = string
  default = "admin"
}

variable "password" {
  type    = string
  default = "Ahina88f!!!!"
}

variable "controller_ip" {
  type    = string
  default = "13.92.243.39"
}

#variable "azure_vng_subnet_cidr" {}

###

variable "name1" {
  default = ""
}

variable "name2" {
  default = ""
}

variable "firewall_image" {
  default = "Palo Alto Networks VM-Series Next-Generation Firewall Bundle 1"
}

variable "firewall_image_version" {
  default = "9.1.0"
}

variable "fw_instance_size" {
  default = "Standard_D3_v2"
}

variable "firewall_username" {
  default = ""
}

variable "firewall_attached" {
  default = ""
}

variable "file_share_folder" {
  default = ""
}

variable "bootstrap_storage_name" {
  default = ""
}

variable "storage_access_key" {
  default = ""
}

variable "local_as_number1" {
  default = ""
}

variable "local_as_number2" {
  default = ""
}

variable "az1" {
  default = ""
}

variable "az2" {
  default = ""
}

variable "azure_vm_spokes1" {
  description = "Map of Names and CIDR ranges to be used for the Spoke VNETSs"
  type        = map(string)
}

variable "azure_vm_spokes2" {
  description = "Map of Names and CIDR ranges to be used for the Spoke VNETSs"
  type        = map(string)
}

variable "azure_account_name" {
  default = "avx-sp-acct"
}

variable "azure_transit_cidr1" {
  default = ""
}

variable "azure_transit_cidr2" {
  default = ""
}

variable "active_mesh" {
  default = ""
}

variable "azure_region1" {
  default = ""
}

variable "azure_region2" {
  default = ""
}

variable "azure_gw_size" {
  default = ""
}

variable "azure_spoke1_name" {
  type    = string
  default = ""
}

variable "azure_spoke1_cidr" {
  type    = string
  default = ""
}

variable "azure_spoke1_region" {
  type    = string
  default = ""
}

variable "azure_spoke2_name" {
  type    = string
  default = ""
}

variable "azure_spoke2_cidr" {
  type    = string
  default = ""
}

variable "azure_spoke2_region" {
  type    = string
  default = ""
}

variable "attached_spoke" {
  type    = bool
  default = true
}

variable "insane" {
  type    = bool
  default = true
}

variable "ha_enabled" {
  type    = bool
  default = true
}

variable "az_support" {
  type    = bool
  default = true
}

variable "azure_test_vm_rg" {
  type    = string
  default = ""
}

variable "instance_size" {
  type    = string
  default = ""
}

variable "instance_size_spokes" {
  type    = string
  default = ""
}

variable "test_instance_size" {
  type    = string
  default = ""
}

variable "enable_bgp_over_lan" {
  type    = string
  default = ""
}
