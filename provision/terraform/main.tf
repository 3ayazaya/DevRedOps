terraform {
  required_providers {
    proxmox = {
      #source = "terraform.local/local/proxmox"
      #version = "2.9.14"
      source = "telmate/proxmox"
      version = "3.0.1-rc1"
    }
  }
}

provider "proxmox" {
  pm_tls_insecure = true
  pm_api_url      = "https://pve02.lab.shmel.xyz:8006/api2/json"
  #pm_user         = var.pm_user
  #pm_password     = var.pm_password
}

module "k3s_masters" {
  count = 1
  source = "./modules/k3s"
  desc   = "K3S Dev Cluster"
  name   = "k3s-srv-master-${count.index+1}"
  tags   = "k3s"
  vmid = tonumber("30${count.index+1}")
  template_name = "ubuntu-2204-cloudinit-template"
  proxmox_host = "pve02"
  storage = "local-zfs"
  vlan = 800
  disk_size = "32"
  os_type = "cloud-init"
  network_bridge = "vmbr2"
  cores = 4
  memory = 4096
  nameserver = "10.1.8.1"
  searchdomain = "k8s.lab.shmel.xyz,lab.shmel.xyz"
}

module "k3s_agents" {
  count          = 1
  source         = "./modules/k3s"
  desc           = "K3S Dev Cluster"
  name           = "k3s-srv-agent-${count.index+1}"
  tags           = "k3s"
  vmid           = tonumber("31${count.index+1}")
  template_name  = "ubuntu-2204-cloudinit-template"
  proxmox_host   = "pve02"
  storage        = "local-zfs"
  vlan           = 800
  disk_size      = "100"
  os_type        = "cloud-init"
  network_bridge = "vmbr2"
  cores          = 4
  memory         = 4096
  nameserver     = "10.1.8.1"
  searchdomain   = "k8s.lab.shmel.xyz,lab.shmel.xyz"
}