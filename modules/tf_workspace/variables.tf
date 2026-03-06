variable "project_name" {
  description = "The name of the TFE project (must include avm- prefix). Defaults to avm-root."
  type        = string

}

variable "enable_auto_apply" {
  description = "Whether to enable auto-apply for the TFE workspace"
  type        = bool
  default     = false
}

variable "tf_organization" {
  description = "The name of the Terraform Cloud/Enterprise organization to create the workspace in"
  type        = string
  default     = "corydon-wood-sandbox"
}

variable "github_repository_identifier" {
  description = "Existing GitHub repository identifier in the format 'owner/repo'."
  type        = string
  default     = null
}

variable "working_directory" {
  description = "The working directory for the TFE workspace (relative to the repository root)"
  type        = string
  default     = "/"
}

variable "github_app_installation_id" {
  description = "The GitHub App installation ID to use for VCS integration (optional, only needed if using GitHub App authentication)"
  type        = string
  default     = "ghain-SLYobWzLuoVpgtrh"
}

variable "repository_branch" {
  description = "The branch to use for the TFE workspace VCS integration"
  type        = string
  default     = "main"
}

variable "workspace_variables" {
  description = "Variables to add to the workspace"
  type = map(object({
    key         = string
    value       = string
    category    = optional(string, "terraform")
    description = optional(string, "")
    sensitive   = optional(bool, false)
    hcl         = optional(bool, false)
  }))
  default = {}
}

variable "workspace_name" {
  type = string
}