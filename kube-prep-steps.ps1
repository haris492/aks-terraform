#### Parameters

$keyvaultname = "hari-aks-kv"
$location = "east us"
$keyvaultrg = "hari-aks-rg"
$sshkeysecret = "sshpublickey"
$spnclientid = "753544d1-172a-4998-b646-52c8b6835115"
$clientidkvsecretname = "spnclientid"
$spnclientsecret = ""
$spnkvsecretname = "spnclientsecret"
$spobjectID = "82d816a9-8e47-49c1-bfac-c302df464956"
$userobjectid = "551dd999-8980-4cd5-9382-59bdeb11c465"


#### Create Key Vault

#### create an ssh key for setting up password-less login between agent nodes.

ssh-keygen  -f ~/.ssh/id_rsa_terraform


#### Add SSH Key in Azure Key vault secret

$pubkey = cat ~/.ssh/id_rsa_terraform.pub

$Secret = ConvertTo-SecureString -String $pubkey -AsPlainText -Force

Set-AzKeyVaultSecret -VaultName $keyvaultname -Name $sshkeysecret -SecretValue $Secret


#### Store service principal Client id in Azure KeyVault

$Secret = ConvertTo-SecureString -String $spnclientid -AsPlainText -Force

Set-AzKeyVaultSecret -VaultName $keyvaultname -Name $clientidkvsecretname -SecretValue $Secret


#### Store service principal Secret in Azure KeyVault

$Secret = ConvertTo-SecureString -String $spnclientsecret -AsPlainText -Force

Set-AzKeyVaultSecret -VaultName $keyvaultname -Name $spnkvsecretname -SecretValue $Secret


#### Provide Keyvault secret access to SPN using Keyvault access policy

Set-AzKeyVaultAccessPolicy -VaultName $keyvaultname -ServicePrincipalName $spobjectID -PermissionsToSecrets Get,Set
