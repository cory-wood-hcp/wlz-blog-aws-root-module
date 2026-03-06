<!-- BEGIN_TF_DOCS -->
# AVM Workspace Module

This module creates a GitHub repository and Te# Create Terraform Enterprise workspace

## Usage

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 6.0 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~> 0.58 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | ~> 0.58 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_variable.workspace_vars](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_workspace.workspace](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [tfe_project.avm](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_auto_apply"></a> [enable\_auto\_apply](#input\_enable\_auto\_apply) | Whether to enable auto-apply for the TFE workspace | `bool` | `false` | no |
| <a name="input_github_app_installation_id"></a> [github\_app\_installation\_id](#input\_github\_app\_installation\_id) | The GitHub App installation ID to use for VCS integration (optional, only needed if using GitHub App authentication) | `string` | `"ghain-SLYobWzLuoVpgtrh"` | no |
| <a name="input_github_repository_identifier"></a> [github\_repository\_identifier](#input\_github\_repository\_identifier) | Existing GitHub repository identifier in the format 'owner/repo'. | `string` | `null` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the TFE project (must include avm- prefix). Defaults to avm-root. | `string` | n/a | yes |
| <a name="input_repository_branch"></a> [repository\_branch](#input\_repository\_branch) | The branch to use for the TFE workspace VCS integration | `string` | `"main"` | no |
| <a name="input_tf_organization"></a> [tf\_organization](#input\_tf\_organization) | The name of the Terraform Cloud/Enterprise organization to create the workspace in | `string` | `"corydon-wood-sandbox"` | no |
| <a name="input_working_directory"></a> [working\_directory](#input\_working\_directory) | The working directory for the TFE workspace (relative to the repository root) | `string` | `"/"` | no |
| <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name) | n/a | `string` | n/a | yes |
| <a name="input_workspace_variables"></a> [workspace\_variables](#input\_workspace\_variables) | Variables to add to the workspace | <pre>map(object({<br/>    key         = string<br/>    value       = string<br/>    category    = optional(string, "terraform")<br/>    description = optional(string, "")<br/>    sensitive   = optional(bool, false)<br/>    hcl         = optional(bool, false)<br/>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tfe_workspace_id"></a> [tfe\_workspace\_id](#output\_tfe\_workspace\_id) | The ID of the Terraform Enterprise workspace |
| <a name="output_tfe_workspace_name"></a> [tfe\_workspace\_name](#output\_tfe\_workspace\_name) | The name of the Terraform Enterprise workspace |
| <a name="output_tfe_workspace_url"></a> [tfe\_workspace\_url](#output\_tfe\_workspace\_url) | The URL of the Terraform Enterprise workspace |
<!-- END_TF_DOCS -->