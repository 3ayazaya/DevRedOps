variable "master_ips" {
  description = "List of ip addresses for master nodes"
  default = [
    "10.1.8.4"
  ]
  type = list(string)
}
variable "agent_ips" {
  description = "List of ip addresses for agent nodes"
  default = [
    "10.1.8.3"
  ]
  type = list(string)
}
variable "network_mask" {
  description = "Network mask prefix"
  default = 25
  type = number
}
variable "gateway" {
  description = "Network default gateway"
  default = "10.1.8.1"
  type = string
}
variable "masters_count" {
  description = "Count of master nodes"
  default = 1
  type = number
}
variable "agents_count" {
  description = "Count of agent nodes"
  default = 1
  type = number
}
variable "vm_desc" {
  description = "VM description"
  default = ""
  type = string
}
variable "template_name" {
  description = "VM template"
  default = ""
  type = string
}
variable "pve_node" {
  description = "Proxmox node name"
  default = "pve"
  type = string
}
variable "pve_storage" {
  description = "Proxmox storage"
  default = "local-lvm"
  type = string
}
variable "vlan_id" {
  description = "Network VLAN ID"
  default = -1
  type = number
}
variable "masters_disk_size" {
  description = "Disk size (Gb) of master nodes"
  default = "32"
  type = string
}
variable "agents_disk_size" {
  description = "Disk size (Gb) of agents nodes"
  default = "64"
  type = string
}
variable "pve_network_bridge" {
  description = "Proxmox network bridge name"
  default = "vmbr0"
  type = string
}
variable "pve_url" {
  description = "Proxmox URL"
  default = "https://pve.home.lab:8006/api2/json"
  type = string
}
variable "masters_cpu" {
  description = "CPU count of master nodes"
  default = 4
  type = number
}
variable "masters_ram" {
  description = "RAM (Mb) of master nodes"
  default = 4096
  type = number
}
variable "agents_cpu" {
  description = "CPU count of agent nodes"
  default = 4
  type = number
}
variable "agents_ram" {
  description = "RAM (Mb) of agent nodes"
  default = 4096
  type = number
}
variable "dns_address" {
  description = "DNS address"
  default = "10.1.8.1"
  type = string
}
variable "dns_search_domains" {
  description = "DNS search domains"
  default = "k8s.home.lab,home.lab"
  type = string
}