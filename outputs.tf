output "failed_manifests" {
  description = "Audit log of manifests that were rejected by the gatekeeper logic."
  value       = module.spacelift_registry.failed_manifests
}

output "module_ids" {
  description = "Map of created module names and their Spacelift IDs."
  value       = module.spacelift_registry.module_ids
}
