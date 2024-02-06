output "ip_address" {
  value       = proxmox_vm_qemu.k3s_agents.default_ipv4_address
  description = "The private IP address of the agents server instance."
}
output "vm_name" {
  value       = proxmox_vm_qemu.k3s_agents.name
  description = "VM name of the agents server instance."
}