provider "azurerm" {
  version = "~> 2.2"
  features {}
}

resource "azurerm_resource_group" "demo" {
  name     = var.rg_name
  location = var.location
}
resource "azurerm_public_ip" "demo" {
  name                    = "AVX-PIP-DEMO"
  location                = azurerm_resource_group.demo.location
  resource_group_name     = azurerm_resource_group.demo.name
  allocation_method       = "Static"
  idle_timeout_in_minutes = 30

  tags = {
    environment = var.env_tag
  }
}

resource "azurerm_virtual_network" "demo" {
  name                = var.vnetname
  address_space       = ["10.0.0.0/24"]
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
}

resource "azurerm_subnet" "demo" {
  name                 = var.subnetname
  resource_group_name  = azurerm_resource_group.demo.name
  virtual_network_name = azurerm_virtual_network.demo.name
  address_prefixes       = ["10.0.0.0/24"]
}

resource "azurerm_network_interface" "demo" {
  name                = "AVX-DEMO-eth0"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name

  ip_configuration {
    name                          = "internal-demo"
    subnet_id                     = azurerm_subnet.demo.id
    private_ip_address_allocation = "Static"
	private_ip_address            = "10.0.0.4"
	public_ip_address_id          = azurerm_public_ip.demo.id
  }
}

resource "null_resource" "accept_license" {
   provisioner "local-exec" {
       command = "az vm image terms accept --urn aviatrix-systems:aviatrix-bundle-payg:aviatrix-enterprise-bundle-byol:5.13.6"
   }
}


resource "azurerm_linux_virtual_machine" "demo" {
  name                = "AVX-DEMO"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location
  size                = "Standard_DS3_v2"
  admin_username      = "lab-user"
  admin_password	  = "Ahina88f!!!!"
  disable_password_authentication = "false"
  network_interface_ids = [
    azurerm_network_interface.demo.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "aviatrix-systems"
    offer     = "aviatrix-bundle-payg"
    sku       = "aviatrix-enterprise-bundle-byol"
    version   = "latest"
  }
    plan {
    name = "aviatrix-enterprise-bundle-byol"
    publisher = "aviatrix-systems"
    product = "aviatrix-bundle-payg"
  }
}
