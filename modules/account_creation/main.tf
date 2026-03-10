resource "aws_organizations_account" "new_account" {
  name                       = var.account_name
  email                      = var.account_email
  parent_id                  = lookup(var.ou_id_map, var.organizational_unit)
  iam_user_access_to_billing = "ALLOW"
  close_on_deletion          = true
  role_name                  = "OrganizationAccountAccessRole"

  tags = var.tags

  lifecycle {
    ignore_changes = [role_name]
    action_trigger {
      events  = [after_create]
      actions = [action.aws_lambda_invoke.remove_account_vpcs]
    }
  }
  timeouts {
    create = "15m"
    delete = "15m"
  }
}

####################
#Assign SSO users
####################

data "aws_ssoadmin_instances" "main" {}

resource "aws_ssoadmin_account_assignment" "admins" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.main.arns)[0]
  permission_set_arn = "arn:aws:sso:::permissionSet/ssoins-72236d4b19ece717/ps-7dfc0a4122958d1a"

  principal_id   = "c4a85418-3051-7040-1461-a177414d5ee2"
  principal_type = "GROUP"

  target_id   = aws_organizations_account.new_account.id
  target_type = "AWS_ACCOUNT"
  timeouts {
    create = "15m"
    delete = "15m"
  }
}

######################################
# Remove Default VPCs
######################################

action "aws_lambda_invoke" "remove_account_vpcs" {
  config {
    function_name = "remove_account_vpcs"
    payload = jsonencode({
      account_id = aws_organizations_account.new_account.id
    })
  }
}