#### Quick one liner to create a service principar with contributor access for onboarding an Azure account into Aviatrix


az ad sp create-for-rbac --name paccar-na-aks --role="Contributor" --scopes="/subscriptions/<subscription id>
