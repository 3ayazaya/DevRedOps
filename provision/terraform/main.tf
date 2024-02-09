terraform {
  required_providers {
    proxmox = {
      #source = "terraform.local/local/proxmox"
      #version = "2.9.14"
      source  = "telmate/proxmox"
      version = "3.0.1-rc1"
    }
  }
  backend "http" {}
}

provider "proxmox" {
  pm_tls_insecure = true
  pm_api_url      = var.pve_url
  #pm_user         = var.pm_user
  #pm_password     = var.pm_password
}

module "k3s_masters" {
  count           = var.masters_count
  source          = "./modules/k3s/masters"
  desc            = var.vm_desc
  name            = "k3s-srv-master-${count.index+1}"
  tags            = "k3s"
  vmid            = tonumber("30${count.index+1}")
  template_name   = var.template_name
  proxmox_host    = var.pve_node
  storage         = var.pve_storage
  vlan            = var.vlan_id
  disk_size       = var.masters_disk_size
  os_type         = "cloud-init"
  network_bridge  = var.pve_network_bridge
  cores           = var.masters_cpu
  memory          = var.masters_ram
  ipconfig0       = "ip=${var.master_ips[count.index]}/${var.network_mask},gw=${var.gateway}"
  nameserver      = var.dns_address
  searchdomain    = var.dns_search_domains
}

module "k3s_agents" {
  count           = var.agents_count
  source          = "./modules/k3s/agents"
  desc            = var.vm_desc
  name            = "k3s-srv-agent-${count.index+1}"
  tags            = "k3s"
  vmid            = tonumber("31${count.index+1}")
  template_name   = var.template_name
  proxmox_host    = var.pve_node
  storage         = var.pve_storage
  vlan            = var.vlan_id
  disk_size       = var.agents_disk_size
  os_type         = "cloud-init"
  network_bridge  = var.pve_network_bridge
  cores           = var.agents_cpu
  memory          = var.agents_ram
  ipconfig0       = "ip=${var.agent_ips[count.index]}/${var.network_mask},gw=${var.gateway}"
  nameserver      = var.dns_address
  searchdomain    = var.dns_search_domains
}

resource "local_file" "ansible-inventory" {
  depends_on = [
    module.k3s_agents,
    module.k3s_masters
  ]
  filename = "./templates/hosts.ini"
  content = templatefile("./templates/hosts.tmpl", {
    k3s_master_ip = module.k3s_masters.*.ip_address
    k3s_agent_ip  = module.k3s_agents.*.ip_address
  })
}