variable "name" {
  description = "name of VM"
  type = string
}

variable "desc" {
  description = "description of VM"
  type = string
}

variable "os_type" {
  description = "Proxmox OS type"
  type = string
  default = "cloud-init"
}

variable "cores" {
  description = "Proxmox VM VCPU cores count"
  type = number
  default = 2
}

variable "memory" {
  description = "Proxmox VM RAM size"
  type = number
  default = 2048
}

variable "disk_size" {
  description = "Proxmox VM disk size"
  type = string
  #type = number
  #default = 32
}

variable "storage" {
  description = "Proxmox VM storage type"
  type = string
  default = "local-lvm"
}

variable "vmid" {
  description = "Proxmox VM id"
  type = number
}

variable "tags" {
  description = "Proxmox VM tags"
  type = string
}

variable "network_bridge" {
  description = "Proxmox VM network bridge"
  type = string
  default = "vmbr1"
}

variable "vlan" {
  description = "Proxmox VM VLAN id"
  type = number
  default = -1
}

variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDIIZD+vNsb83nE28pHcR7N0CoknDnoSaEY1Hf3nDgELixQoWhlC7+bOnH4J22WTEd1lCGLkyCKjvwowSwajmFFpaxn10sZbZDaI+imjZ+RcaX9ZGslG26fo0X7QGqVRvyIwwDVPURcyxIQpiQo3nrCixheP2vjf+64vF8894JM516Fk+61RbtjriBI6GJjup5zjv0NvLowCLbPBuDzIlCCkHXV/sOLj2Mk6XG34iEVq1fWjo+YQHWBZD5ipmb57MfCGM55SwHLTy1wqiuDOlvKKFLQb+G82SorBMO538L/ETOMo2pI4rJLKtYuAxd7mj3/un6OUoz7AQ3PCBUrQqJAotqL4dkW5FhW4kk3MU1gB+/AZdcfyQZLV5wvrPFxItZd9uezPs8jjp0rgh3iXzR7+o29pPwHuZYPfmWBsgH1xI4Zt9IhGylgSLlfOaHJiWtym75BB3vlemYbBXt4n20FrBXjNsYwrMANNRS2cZ3thD6GTtPsz2V0hH5nD0Wyh3s= z0yac@MacBook-Pro"
}

variable "pm_user" {
  default = "user"
}
variable "pm_password" {
  sensitive = true
  default   = "password"
}
variable "proxmox_host" {
  description = "Proxmox cluster node name"
  type = string
}
variable "template_name" {
  description = "Proxmox template name for clone"
  type = string
}
variable "pool" {
  description = "Proxmox VMs pool name"
  type = string
  default = ""
}
variable "ciuser" {
  default = "root"
}
variable "cipassword" {
  default = "toor"
}
variable "nameserver" {
  default = "192.168.20.1"
}
variable "searchdomain" {
  default = "k8s.home.lab,home.lab"
}
variable "agent_ips" {
  description = "List of ip addresses for agent nodes"
  default = [
    "10.1.8.3"
  ]
  type = list(string)
}
variable "networkmask" {
  description = "Network mask prefix"
  default = 25
  type = number
}
variable "gateway" {
  description = "Network default gateway"
  default = "10.1.8.1"
  type = string
}
variable "ipconfig0" {
  description = "Cloud init network"
  default = "ip=dhcp"
  type = string
}
