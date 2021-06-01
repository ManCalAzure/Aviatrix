Work in progress...


### Creating a Resource Group or use Existing
<pre lang= >
az group create --name RG-RouteServer --location eastus --output table
</pre>
az network vnet subnet create -g RG-RouteServer --vnet-name  --name "RouteServerSubnet" --address-prefix "10.0.0.0/24"

az network routeserver create --resource-group RG-RS-TEST --name RS1-EAST --hosted-subnet RouteServerSubnet 
az network routeserver create -n "myRouteServer" -g "RouteServerRG" --hosted-subnet $subnet_id  
*The location needs to match the location of your virtual network. The HostedSubnet is the RouteServerSubnet ID you obtained in the previous section.
</pre>
