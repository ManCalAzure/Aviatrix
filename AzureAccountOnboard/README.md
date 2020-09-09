#### Quick one liner to create a service principal with contributor access for onboarding an Azure account into Aviatrix

<pre lang= >
az ad sp create-for-rbac --name "<...>" --role="Contributor" --scopes="/subscriptions/<...>
</pre>

