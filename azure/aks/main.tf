locals {
  tags = {
    owner       = var.owner
    environment = var.environment
  }
}

resource "azurerm_resource_group" "aks" {
  name     = "RG-${var.location.short}-aks-${var.cluster_name}"
  location = var.location.full
  tags     = local.tags
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = var.dns_prefix
  #kubernetes_version      = "1.20.2"
  private_cluster_enabled = false
  tags                    = local.tags

  default_node_pool {
    name                = "system"
    node_count          = var.node_count
    vm_size             = var.default_node_pool_vm_size
    os_disk_size_gb     = "30"
    vnet_subnet_id      = data.azurerm_subnet.sn.id
    enable_auto_scaling = true
    min_count           = 1
    max_count           = var.auto_scaling_max
    tags                = local.tags
    type                = "VirtualMachineScaleSets"

    node_labels = {
      "application" = "utils"
    }
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "Standard"
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

resource "azurerm_kubernetes_cluster_node_pool" "spot_nodepool" {
  name                  = "adospot"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = "Standard_D2as_v4"
  node_count            = 0
  min_count             = 0
  max_count             = 3
  priority              = "Spot"
  enable_auto_scaling   = var.enable_autoscaling
  eviction_policy       = "Delete"
  spot_max_price        = -1
  os_disk_size_gb       = "30"

  node_labels = {
    "kubernetes.azure.com/scalesetpriority" = "spot"
    "application"                           = "ADO"
  }
  node_taints = [
    "kubernetes.azure.com/scalesetpriority=spot:NoSchedule"
  ]

  tags = local.tags
}

resource "azurerm_kubernetes_cluster_node_pool" "zrs_nodepool" {
  name                  = "adozrs"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = "Standard_D2as_v4"
  node_count            = 0
  min_count             = 0
  max_count             = 3
  enable_auto_scaling   = var.enable_autoscaling
  os_disk_size_gb       = "30"
  availability_zones    = ["1", "2"]

  node_labels = {
    "kubernetes.azure.com/scalesetpriority" = "zrs"
    "application"                           = "ADO"
  }
  node_taints = [
    "kubernetes.azure.com/scalesetpriority=zrs:NoSchedule"
  ]

  tags = local.tags
}