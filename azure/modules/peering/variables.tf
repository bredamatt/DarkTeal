variable "resource_group_name" {
  description = "The resource group where the peering connection will be established."
  type        = string
}

variable "hub_network_name" {
  description = "The hub network name where the peering connection will be established"
  type        = string
}

variable "hub_network_id" {
  description = "The hub network id where the peering connection will be established"
  type        = string
}

variable "spoke_network_name" {
  description = "The spoke network name where the peering connection will be established"
  type        = string
}

variable "spoke_network_id" {
  description = "The spoke network id where the peering connection will be established"
  type        = string
}
