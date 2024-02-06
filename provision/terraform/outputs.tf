output "k3s_masters" {
  value       = module.k3s_masters
  description = "Master nodes info"
}
output "k3s_agents" {
  value       = module.k3s_agents
  description = "Agent nodes info"
}