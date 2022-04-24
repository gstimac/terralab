data "azurerm_container_registry" "acr" {
  count               = var.acr_name == "" ? 0 : 1
  name                = "${var.environment}eastusacr"
  resource_group_name = "main-${var.location.short}-acr-RG"
}

resource "azurerm_role_assignment" "acr" {
  count                            = var.acr_name == "" ? 0 : 1
  scope                            = data.azurerm_container_registry.acr[0].id
  role_definition_name             = "acrpull"
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  skip_service_principal_aad_check = true
  depends_on = [
    azurerm_kubernetes_cluster.aks
  ]
}
