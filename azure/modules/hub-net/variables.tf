variable "cidr_block" {
  description = "The CIDR of the virtual network"
  type        = string
}

variable "name" {
  description = "The name of the network"
  default     = "darkteal"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
