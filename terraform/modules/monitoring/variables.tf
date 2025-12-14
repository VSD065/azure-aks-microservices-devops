variable "location" {
  type = string
}

variable "name_prefix" {
  type = string
}

variable "enable_log_analytics" {
  type    = bool
  default = true
}

variable "enable_app_insights" {
  type    = bool
  default = true
}

variable "resource_group_name" {
  type = string
}

