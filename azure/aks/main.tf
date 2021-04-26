locals {
  tags = {
    owner       = var.owner
    environment = var.environment
  }
}

resource "azurerm_resource_group" "aks" {
  name     = "main-${var.location.short}-aks-RG"
  location = var.location.full
  tags     = local.tags
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                    = var.cluster_name
  location                = azurerm_resource_group.aks.location
  resource_group_name     = azurerm_resource_group.aks.name
  dns_prefix              = var.dns_prefix
  kubernetes_version      = "1.20.2"
  private_cluster_enabled = false
  tags                    = local.tags

  default_node_pool {
    name                = "default"
    node_count          = var.node_count
    vm_size             = var.default_node_pool_vm_size
    vnet_subnet_id      = data.azurerm_subnet.sn.id
    availability_zones  = var.availability_zones
    enable_auto_scaling = false
//    min_count            = var.auto_scaling_min
//    max_count            = var.auto_scaling_max
    tags                = local.tags
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
    outbound_type     = "loadBalancer"
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control {
    enabled = "true"
  }

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = var.ssh_public_key
    }
  }
}