aks_vnet_name = "aksvnet"

sshkvsecret = "sshpublickey"

clientidkvsecret = "spnclientid"

spnkvsecret = "spnclientsecret"

vnetcidr = ["10.0.0.0/24"]

subnetcidr = ["10.0.0.0/25"]

keyvault_rg = "hari-aks-rg"

keyvault_name = "hari-aks-kv"

azure_region = "aksdemocluster-rg"

resource_group = "aksdemocluster-rg"

cluster_name = "aksdemocluster"

dns_name = "aksdemocluster"

admin_username = "aksuser"

kubernetes_version = "1.29.2"

agent_pools = {
      name            = "pool1"
      count           = 2
      vm_size         = "Standard_D2_v2"
      os_disk_size_gb = "30"
    }
