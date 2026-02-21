# Call the reusable core orchestrator module
module "spacelift_registry" {
  # Redirected to GitHub for High Assurance Trial
  source = "git::https://github.com/MNohava1987/terraform-spacelift-m-orch.git?ref=main"

  # Integration Settings
  vcs_root_int_pw       = var.vcs_root_int_pw
  spacelift_webhook_url = var.spacelift_webhook_url
  vcs_integration_id    = var.vcs_integration_id

  # Path to local manifests and global configs
  manifest_dir   = "${path.module}/manifests"
  defaults_file  = "${path.module}/config/_defaults.json"
  overrides_file = "${path.module}/config/_overrides.json"

  # Configuration wiring
  admin_context_name  = var.admin_context_name
  webhook_events      = var.webhook_events
  default_space_id    = var.default_space_id
  # ADO Project is now used as GitHub Namespace/Org
  default_ado_project = "MNohava1987"
}
