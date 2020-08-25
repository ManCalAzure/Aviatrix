### All code together:
<pre lang= >
az group create --name RG-AVX-CONTROLLER --location eastus --output table
az storage account create -n avxbootdiag -g RG-AVX-CONTROLLER -l eastus --sku Standard_LRS
az network vnet create --name VNET-AVX-CONTROLLER --resource-group RG-AVX-CONTROLLER --location eastus --address-prefix 10.0.0.0/24
az network vnet subnet create --vnet-name VNET-AVX-CONTROLLER --name SUB1 --resource-group RG-AVX-CONTROLLER --address-prefixes 10.0.0.0/24 --output table
az network public-ip create --name AVX-CONTROLLER --allocation-method Static --resource-group  RG-AVX-CONTROLLER --location eastus --sku Basic
az network nic create --resource-group RG-AVX-CONTROLLER --location eastus --name AVX-CONTROLLER-eth0 --vnet-name VNET-AVX-CONTROLLER --subnet SUB1 --public-ip-address  AVX-CONTROLLER --private-ip-address 10.0.0.4
az vm image list --all --publisher Aviatrix --output table
az vm image terms accept --urn aviatrix-systems:aviatrix-bundle-payg:aviatrix-enterprise-bundle-byol:5.13.6
az vm create --resource-group RG-AVX-CONTROLLER --location eastus --name AVX-CONTROLLER --size Standard_DS3_v2 --nics AVX-CONTROLLER-eth0 --image aviatrix-systems:aviatrix-bundle-payg:aviatrix-enterprise-bundle-byol:5.13.6 --admin-username "<username>" --admin-password "<password>" --boot-diagnostics-storage avxbootdiag --no-wait
</pre>

### Step by step process to launch an Aviatrix controller using Azure CLI

1.	Create a resource group
<pre lang= >
az group create --name RG-AVX-CONTROLLER --location eastus --output table
</pre>

2.	Create a storage account for the Aviatrix controller bootdiags
<pre lang= >
az storage account create -n avxbootdiag -g RG-AVX-CONTROLLER -l eastus --sku Standard_LRS
</pre>
3.	Create A VNET and Subnet
<pre lang= >
az network vnet create --name VNET-AVX-CONTROLLER --resource-group RG-AVX-CONTROLLER --location eastus --address-prefix 10.0.0.0/24

az network vnet subnet create --vnet-name VNET-AVX-CONTROLLER --name SUB1 --resource-group RG-AVX-CONTROLLER --address-prefixes 10.0.0.0/24 --output table
</pre>

4.	Create a public IP object for the Aviatrix controller
<pre lang= >
az network public-ip create --name AVX-CONTROLLER --allocation-method Static --resource-group  RG-AVX-CONTROLLER --location eastus --sku Basic
</pre>

5.	Create a vNIC for the controller and bind the public IP object create above
<pre lang= >
az network nic create --resource-group RG-AVX-CONTROLLER --location eastus --name AVX-CONTROLLER-eth0 --vnet-name VNET-AVX-CONTROLLER --subnet SUB1 --public-ip-address  AVX-CONTROLLER --private-ip-address 10.0.0.4
</pre>

6.	Get the Aviatrix marketplace image list
<pre lang= >
az vm image list --all --publisher Aviatrix --output table
</pre>

7.	Once you know the image you are going to use, accept the terms
<pre lang= >
az vm image terms accept --urn aviatrix-systems:aviatrix-bundle-payg:aviatrix-enterprise-bundle-byol:5.13.6
</pre>

8.	Deploy the controller VM
<pre lang= >
az vm create --resource-group RG-AVX-CONTROLLER --location eastus --name AVX-CONTROLLER --size Standard_DS3_v2 --nics AVX-CONTROLLER-eth0 --image aviatrix-systems:aviatrix-bundle-payg:aviatrix-enterprise-bundle-byol:5.13.6 --admin-username "<username>" --admin-password "<password>" --boot-diagnostics-storage avxbootdiag --no-wait
</pre>

This is the output you will see in the Azure portal:

Portal access:
 


