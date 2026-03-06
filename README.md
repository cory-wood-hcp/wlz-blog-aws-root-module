# wlz-blog-aws-root-module
<!-- BEGIN_TF_DOCS -->


## Usage

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 6.0 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~> 0.58 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | ~> 0.58 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_account_creation"></a> [account\_creation](#module\_account\_creation) | ./modules/account_creation | n/a |
| <a name="module_iam_configuration_workspace"></a> [iam\_configuration\_workspace](#module\_iam\_configuration\_workspace) | ./modules/tf_workspace | n/a |
| <a name="module_platform_services_configuration_workspace"></a> [platform\_services\_configuration\_workspace](#module\_platform\_services\_configuration\_workspace) | ./modules/tf_workspace | n/a |

## Resources

| Name | Type |
|------|------|
| [tfe_workspace_run.iam_ws_run](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace_run) | resource |
| [tfe_workspace_run.platform_services_ws_run](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace_run) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_email"></a> [account\_email](#input\_account\_email) | n/a | `string` | n/a | yes |
| <a name="input_app_abbreviation"></a> [app\_abbreviation](#input\_app\_abbreviation) | Application abbreviation (2-12 alphabetic characters) | `string` | n/a | yes |
| <a name="input_enable_ap_sotuheast_1"></a> [enable\_ap\_sotuheast\_1](#input\_enable\_ap\_sotuheast\_1) | Enable generation for ap-southeast-1 region | `bool` | n/a | yes |
| <a name="input_enable_ap_south_1"></a> [enable\_ap\_south\_1](#input\_enable\_ap\_south\_1) | Enable generation for ap-south-1 region | `bool` | n/a | yes |
| <a name="input_enable_us_east_1"></a> [enable\_us\_east\_1](#input\_enable\_us\_east\_1) | Enable generation for us-east-1 region | `bool` | n/a | yes |
| <a name="input_enable_us_east_2"></a> [enable\_us\_east\_2](#input\_enable\_us\_east\_2) | Enable generation for us-east-2 region | `bool` | n/a | yes |
| <a name="input_enable_us_west_2"></a> [enable\_us\_west\_2](#input\_enable\_us\_west\_2) | Enable generation for us-west-2 region | `bool` | n/a | yes |
| <a name="input_organizational_unit"></a> [organizational\_unit](#input\_organizational\_unit) | The organizational unit for which to generate the file | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the account | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_id"></a> [account\_id](#output\_account\_id) | n/a |
| <a name="output_iam_workspace_id"></a> [iam\_workspace\_id](#output\_iam\_workspace\_id) | n/a |
| <a name="output_iam_workspace_url"></a> [iam\_workspace\_url](#output\_iam\_workspace\_url) | n/a |
| <a name="output_ps_workspace_id"></a> [ps\_workspace\_id](#output\_ps\_workspace\_id) | n/a |
| <a name="output_ps_workspace_url"></a> [ps\_workspace\_url](#output\_ps\_workspace\_url) | n/a |
<!-- END_TF_DOCS -->