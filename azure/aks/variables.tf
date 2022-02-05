variable "ssh_public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCswS+E1sd3b78oecd+rvlLAvxgKfyNd/a6vpU5iRzKj8Vpvmsu9L3V/O6AW6sBQTH2JHd0WHXNgVQx7anPgStu9BSuIOUtgeyic/buB/dxDex5iRXLB3mB72RhP/lu5PB//nl3TLwlXMIz8YZ9ABTsHAqfdFOcBizaLsxZMiYk27QJ1eiNn2nUOdD9DfmyqTBKgtzAkQw5ji5ylCOAjKi0/6fRYnMvDDqNt0gB1JuM1sDxptr/VsJNyIiBymg/di9RQET44G99ugKrQKfmuld++aBIn/DrMjW3l8SBphtIFoe0A8qK6YrGCScPMOcGOJazXmbFNKhbFeM59genmX6jZ9DzxI+19iSZM3nZSEWOiijhgqgz3tWCNtY2Hnd4W2Wf0TUPRXTnmJyFUwcImVLKY8q6DNNoSzqWMwzZsDp+8YmWSHBn2HwXdbm0JZ2RqRTqjJlYWVaB2W+7dYteo1HFz5fnVBFifiNtUtBBjp5sVLmCedI3dU+sl6Jac/cpZdX8R9ow4qlOUq5TruMNAhLLE2hihrb0GxxjJz+sH3HX/NIWY3jEPRdResyKjizQUBRIMp/o7JsaFhm+lzysfd+v3UiD9aPYvEEe6gtDab0Gnlw2KRFHgJeiuB38/ExGg0Ndxvkf5Q6+MOXVqKCzf0EelwwVNgh74Fal11a4Beru/Q== goran@DESKTOP-UFM55D3"
}

variable "cluster_name" {
  default = "lab"
}

variable "subscription" {
  default = "320c6aee-903c-465f-81d1-9463af62e06f"
}

variable "location" {
  type = object({
    full  = string
    short = string
  })
  default = {
    full  = "eastus"
    short = "eus"
  }
}

variable "owner" {
  default = "goran.stimac"
}

variable "vnet_name" {
  default = "main-eus-VNET"
}

variable "vnet_resource_group_name" {
  default = "main-eus-vnet-RG"
}

variable "subnet_name" {
  default = "cicd-SNET"
}

variable "acr_name" {
  default = ""
}

variable "acr_resource_group_name" {
  default = ""
}

variable "environment" {
  default = "dev"
}

variable "dns_prefix" {
  default = "cicd"
}

variable "sku_tier" {
  default = "Basic"
}

variable "default_node_pool_name" {
  default = "default"
}

variable "default_node_pool_vm_size" {
  default = "Standard_B2s"
}

variable "node_count" {
  default = 1
}

variable "enable_autoscaling" {
  default = "true"
}

variable "auto_scaling_max" {
  default = "3"
}

variable "auto_scaling_min" {
  default = "0"
}
