/**
 * # AVM Workspace Module
 *
 * This module creates a GitHub repository and Te# Create Terraform Enterprise workspace
resource "tfe_workspace" "workspace" {
  name                  = local.repository_name
  organization          = "syf-avm"
  description           = "Terraform workspace for managing ${var.name} ${var.type} resources"
  working_directory     = "/"
  file_triggers_enabled = false
  assessments_enabled   = true

  project_id = var.project_name != null ? tfe_project.project[0].id : data.tfe_project.avm[0].idterprise
 * workspace for managing avm resources.
 */

# data "tfe_github_app_installation" "gha_installation" {
#   name = "cory-wood-hcp"
# }

# Data source to get existing project when create_project is false
data "tfe_project" "avm" {
  name         = var.project_name
  organization = var.tf_organization
}

# Create Terraform Enterprise workspace
resource "tfe_workspace" "workspace" {
  name                  = var.workspace_name
  organization          = var.tf_organization
  working_directory     = var.working_directory
  file_triggers_enabled = false
  assessments_enabled   = true
  auto_apply            = var.enable_auto_apply

  project_id = data.tfe_project.avm[0].id

  vcs_repo {
    identifier                 = var.github_repository_identifier
    branch                     = var.repository_branch
    github_app_installation_id = var.github_app_installation_id
  }

  tag_names = [
    "avm",
    "infrastructure",
  ]
}

resource "tfe_variable" "workspace_vars" {
  for_each     = var.workspace_variables
  key          = each.value.key
  value        = each.value.value
  category     = each.value.category
  workspace_id = tfe_workspace.workspace.id
  description  = each.value.description
  hcl          = each.value.hcl
  sensitive    = each.value.sensitive
}