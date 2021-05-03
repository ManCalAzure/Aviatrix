#### Quick one liner to create a service principal with contributor access for onboarding an Azure account into Aviatrix

<pre lang= >
az ad sp create-for-rbac --name "name you want to use here" --role="Contributor" --scopes=/subscriptions/xxxx-xx-xxxx-xxxx (replace Xs with subscription id)
</pre>

