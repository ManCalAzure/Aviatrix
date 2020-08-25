### Refer to my previons lab to launch an Avaitrix controller
</b><a href="https://github.com/ManCalAzure/AzureLabs/edit/master/Aviatrix/ControllerLaunchTerraform/README.md">here</a>.<br />

### Specify Aviatrix as the provider with these parameters: controller_ip, username, password, version
<pre lang= >
provider "aviatrix" {
    controller_ip = "<public IP of controller>"
    username = "admin"
    password = "<controller password>"
    version = "2.2"
}
</pre>
### Launch a gateway with these parameters:
<pre lang= >
resource "aviatrix_gateway" "testGW" {
    account_name = "for-create2"
    cloud_type = 1
    gw_name = "<gateway name>"
    vpc_id = "VNET name"
    vpc_reg = "<region>
    gw_size = "<vm flavor>
    subnet = "x.x.x.x/x"
    ha_subnet = "x.x.x.x/x"
}
</pre>

