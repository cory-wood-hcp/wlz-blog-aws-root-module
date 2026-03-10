module "iam_configuration_workspace" {
  source                       = "./modules/tf_workspace"
  workspace_name               = "wlz-iam-configuration-${local.account_name}"
  github_repository_identifier = "cory-wood-hcp/wlz-blog-configuration-iam"
  project_name                 = lookup(local.project_name, var.organizational_unit)
  workspace_variables = {
    aws_account_id = {
      key         = "aws_account_id"
      value       = module.account_creation.account_id
      category    = "terraform"
      description = "ID of account being configured"
    }
    # aws_account_name = {
    #   key         = "aws_account_name"
    #   value       = local.account_name
    #   category    = "terraform"
    #   description = "Name of account being configured"
    # }
  }
  depends_on = [module.account_creation]
}

resource "tfe_workspace_variable_set" "iam_aws_access" {
  variable_set_id = "varset-RLGAkLpHqwMkg6fd"
  workspace_id    = module.iam_configuration_workspace.tfe_workspace_id
  depends_on = [module.platform_services_configuration_workspace]
}

resource "tfe_workspace_run" "iam_ws_run" {
  workspace_id = module.iam_configuration_workspace.tfe_workspace_id

  apply {
    manual_confirm    = false
    wait_for_run      = true
    retry_attempts    = 2
    retry_backoff_min = 1
  }

  destroy {
    manual_confirm    = false
    wait_for_run      = true
    retry_attempts    = 3
    retry_backoff_min = 10
  }
  depends_on = [tfe_workspace_variable_set.iam_aws_access, module.iam_configuration_workspace]
}