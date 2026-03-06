output "tfe_workspace_id" {
  description = "The ID of the Terraform Enterprise workspace"
  value       = tfe_workspace.workspace.id
}

output "tfe_workspace_name" {
  description = "The name of the Terraform Enterprise workspace"
  value       = tfe_workspace.workspace.name
}

output "tfe_workspace_url" {
  description = "The URL of the Terraform Enterprise workspace"
  value       = "https://app.terraform.io/app/${var.tf_organization}/workspaces/${tfe_workspace.workspace.name}"
}