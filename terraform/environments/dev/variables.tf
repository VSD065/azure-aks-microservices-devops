variable "environment" {}
variable "location" {}
variable "name_prefix" {}

variable "vnet_cidr" {}
variable "public_subnet_cidr" {}
variable "private_subnet_cidr" {}

variable "kubernetes_version" {}
variable "aks_node_count" {}
variable "aks_node_vm_size" {}

variable "acr_name" {}
variable "key_vault_name" {}
variable "aks_cluster_name" {}

variable "enable_log_analytics" {
  type    = bool
  default = true
}

variable "enable_app_insights" {
  type    = bool
  default = true
}

variable "service_cidr" {}
variable "dns_service_ip" {}

