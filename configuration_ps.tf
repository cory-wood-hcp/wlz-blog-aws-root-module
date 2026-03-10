module "platform_services_configuration_workspace" {
  source                       = "./modules/tf_workspace"
  workspace_name               = "wlz-ps-configuration-${local.account_name}"
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
      # value       = "[\"${join("\",\"", local.selected_regions)}\"]"
      value       = "[\"${join("\",\"", var.enabled_regions)}\"]"
      hcl         = true
      category    = "terraform"
      description = "Enabled regions for the account"
    }
    TFC_AWS_PROVIDER_AUTH = {
      key         = "TFC_AWS_PROVIDER_AUTH"
      value       = "true"
      category    = "env"
      description = "Enables Terraform Cloud to authenticate to AWS using the provided role ARN"
    }
    TFC_DEFAULT_AWS_RUN_ROLE_ARN = {
      key         = "TFC_DEFAULT_AWS_RUN_ROLE_ARN"
      value       = "arn:aws:iam::${module.account_creation.account_id}:role/PlatformServicesTerraformRole"
      category    = "env"
      description = "ARN of the role that Terraform Cloud will assume to access AWS for iam configuration"
    }
  }
  depends_on = [tfe_workspace_run.iam_ws_run]
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