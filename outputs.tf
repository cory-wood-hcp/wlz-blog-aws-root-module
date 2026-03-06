output "account_id" {
  value = module.account_creation.account_id
}

output "ps_workspace_id" {
  value = module.platform_services_configuration_workspace.tfe_workspace_id
}
output "ps_workspace_url" {
  value = module.platform_services_configuration_workspace.tfe_workspace_url
}

output "iam_workspace_id" {
  value = module.iam_configuration_workspace.tfe_workspace_id
}

output "iam_workspace_url" {
  value = module.iam_configuration_workspace.tfe_workspace_url
}