variable "client_id" {
	default="35d51a2b-2263-4750-95ab-8bebd0e66c11"	        
}

variable "client_secret" {
	default="0c6d3baa-e063-417a-bf77-e213c80c467f"	
}

provider "azurerm" {
        subscription_id = "a78dd370-2e4d-44b3-a09f-74bcc3383653"       
}
resource "azurerm_resource_group" "rg" {
        name = "SampleResourceGroup"
        location = "westus"
}

resource "azurerm_container_registry" "acr" {
        name                     = "sampleacr123"
        resource_group_name      = "${azurerm_resource_group.rg.name}"
        location                 = "${azurerm_resource_group.rg.location}"
        sku                      = "Basic"
}

resource "azurerm_kubernetes_cluster" "aks" {
        name                = "SampleAKSCluster"
        location            = "${azurerm_resource_group.rg.location}"
        resource_group_name = "${azurerm_resource_group.rg.name}"
        dns_prefix          = "acctestagent1"
        service_principal {
                client_id     = "${var.client_id}"
                client_secret = "${var.client_secret}"
        }

        agent_pool_profile {
                name            = "default"
                count           = 1
                vm_size         = "Standard_D1_v2"
                os_type         = "Linux"
                os_disk_size_gb = 30
        }

}

output "client_certificate" {
  value = "${azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate}"
}

output "kube_config" {
  value = "${azurerm_kubernetes_cluster.aks.kube_config_raw}"
}