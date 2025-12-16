variable "location" {
  type = string
}

variable "name_prefix" {
  type = string
}

variable "aks_cluster_name" {
  type = string
}

variable "kubernetes_version" {
  type = string
}

variable "node_count" {
  type = number
}

variable "node_vm_size" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "acr_id" {
  type = string
}

variable "log_analytics_id" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "service_cidr" {
  description = "AKS service CIDR"
  type        = string
}

variable "dns_service_ip" {
  description = "AKS DNS service IP"
  type        = string
}

