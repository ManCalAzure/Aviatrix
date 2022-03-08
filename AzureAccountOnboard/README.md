### Quick one liner to create a service principal with contributor access for onboarding an Azure account into Aviatrix
<pre lang= >
az ad sp create-for-rbac --name "name you want to use here" --role="Contributor" --scopes=/subscriptions/xxxx-xx-xxxx-xxxx (replace Xs with subscription id)
</pre>

### If contributor role is not an option, Aviatrix has a custom role defined which you can put into a JSON file. 
### Aviatrix Custom Role
<pre lang= >
{
  "Name": "Aviatrix Role"
  "IsCustom": true,
  "Description": "Aviatrix Custom role for the network and gateway services",
  "Actions": [
    "Microsoft.Storage/*/read",
    "Microsoft.Network/*/read",
    "Microsoft.Compute/*/read",
    "Microsoft.Compute/virtualMachines/start/action",
    "Microsoft.Compute/virtualMachines/restart/action",
    "Microsoft.Authorization/*/read",
    "Microsoft.ResourceHealth/availabilityStatuses/read",
    "Microsoft.Resources/subscriptions/resourceGroups/read",
    "Microsoft.Insights/alertRules/*",
    "Microsoft.Support/*"
  ],
    "AssignableScopes": [
    "/subscriptions/[SUBSCRIPTION ID HERE]"
	],
	"notActions": [
	],
	"dataActions":[
	],
	"notDataActions":[
	]
}
</pre>

###  Take the information above, or download the aviatrix-role.json file attached to this repo and create the role
<pre lang= >
az role definition create --role-definition ~/path/to/aviatrix-role.JSON < ==== patch can be your local machine if you have Az CLI installed
<b>Example:</b>
az role definition create --role-definition c:\Users\userx\aviatrix-role.JSON
</pre>

### Create the Service principal and assign the Aviatrix role
<pre lang= >
az ad sp create-for-rbac --name "avx-test-sp" --role="Aviatrix Role" --scopes=/subscriptions/xxxxx-xxxxx-xxxxx-xxxxx
</pre>

