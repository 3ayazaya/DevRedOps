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

resource "proxmox_vm_qemu" "k3s_agents" {
  pool        = var.pool
  name        = var.name
  desc        = var.desc
  target_node = var.proxmox_host
  os_type     = var.os_type
  qemu_os     = "l26"
  cloudinit_cdrom_storage = var.storage
  full_clone  = true
  memory      = var.memory
  sockets     = "1"
  cores       = var.cores
  vcpus       = 0
  hastate     = ""
  cpu         = "host"
  scsihw      = "virtio-scsi-pci"
  clone       = var.template_name
  agent       = 1
  vmid        = var.vmid
  tags        = var.tags
  disks {
    scsi {
      scsi0 {
        disk {
          size    = var.disk_size
          storage = var.storage
          discard = "true"
        }
      }
    }
  }
  #disk {
  #  size    = var.disk_size
  #  storage = var.storage
  #  #discard = "true"
  #  type = "scsi"
  #}
  network {
    model  = "virtio"
    bridge = var.network_bridge
    tag    = var.vlan
  }

  # Cloud-init section
  ipconfig0    = var.ipconfig0
  ciuser       = var.ciuser
  cipassword   = var.cipassword
  nameserver   = var.nameserver
  searchdomain = var.searchdomain

  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}