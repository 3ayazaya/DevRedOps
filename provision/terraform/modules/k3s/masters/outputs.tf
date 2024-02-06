output "ip_address" {
  value       = proxmox_vm_qemu.k3s_masters.default_ipv4_address
  description = "The private IP address of the master server instance."
}
output "vm_name" {
  value       = proxmox_vm_qemu.k3s_masters.name
  description = "VM name of the master server instance."
}