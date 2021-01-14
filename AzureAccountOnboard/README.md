#### Quick one liner to create a service principal with contributor access for onboarding an Azure account into Aviatrix

<pre lang= >
az ad sp create-for-rbac --name "account name" --role="Contributor" --scopes="/subscriptions/"subsctiption ID xxx-xx-xxxx-xxxx"
</pre>

