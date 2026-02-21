# Spacelift Integration Settings
variable "vcs_integration_id" {
  description = "The ID of the Azure DevOps integration in Spacelift."
  type        = string
  default     = "azuredevops_mclm"
}

variable "admin_context_name" {
  description = "The context ID (slug) of the primary context to attach to all modules."
  type        = string
}

# Webhook Authentication
variable "vcs_root_int_pw" {
  description = "The basic auth password for the ADO webhook subscription."
  type        = string
  sensitive   = true
}

variable "spacelift_webhook_url" {
  description = "The endpoint URL provided by Spacelift for the ADO integration."
  type        = string
}

# Global Defaults (Fallback values)
variable "default_space_id" {
  description = "The Spacelift Space where modules will be created if not overridden."
  type        = string
  default     = "dev-module"
}

variable "default_ado_project" {
  description = "The default Azure DevOps project name for repository lookups."
  type        = string
  default     = "CLZ Technology and Automation"
}

# Event Configuration
variable "webhook_events" {
  description = "A map of event names to ADO event types that trigger Spacelift."
  type = map(object({
    event_type : string
  }))
  default = {
    gitpush            = { event_type = "git_push" }
    pr_commented       = { event_type = "git_pull_request_commented" }
    pr_created         = { event_type = "git_pull_request_created" }
    pr_merge_attempted = { event_type = "git_pull_request_merge_attempted" }
    pr_updated         = { event_type = "git_pull_request_updated" }
  }
}
