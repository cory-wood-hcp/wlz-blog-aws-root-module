module "platform_services_configuration_workspace" {
  source                       = "./modules/tf_workspace"
  workspace_name               = "avm-${local.account_name}-ps-configuration"
  github_repository_identifier = "cory-wood-hcp/wlz-blog-configuration-platform-services"
  project_name                 = lookup(local.project_name, var.organizational_unit)
  workspace_variables = {
    aws_account_id = {
      key         = "aws_account_id"
      value       = module.account_creation.account_id
      category    = "terraform"
      description = "ID of account being configured"
    }
    aws_account_name = {
      key         = "aws_account_name"
      value       = local.account_name
      category    = "terraform"
      description = "Name of account being configured"
    }
    enabled_regions = {
      key         = "enabled_regions"
      value       = "[\"${join("\",\"", local.selected_regions)}\"]"
      hcl         = true
      category    = "terraform"
      description = "Enabled regions for the account"
    }
  }
}

resource "tfe_workspace_run" "platform_services_ws_run" {
  workspace_id = module.platform_services_configuration_workspace.tfe_workspace_id

  apply {
    manual_confirm    = false
    wait_for_run      = true
    retry_attempts    = 2
    retry_backoff_min = 2
  }

  destroy {
    manual_confirm    = false
    wait_for_run      = true
    retry_attempts    = 3
    retry_backoff_min = 10
  }
}