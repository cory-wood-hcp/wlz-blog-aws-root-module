module "account_creation" {
  source              = "./modules/account_creation"
  account_name        = local.account_name
  account_email       = var.account_email
  organizational_unit = var.organizational_unit
  ou_id_map = {
    operate = "ou-usuf-qdmvfmf4"
    sandbox = "ou-usuf-tiqh0htq"
  }
}