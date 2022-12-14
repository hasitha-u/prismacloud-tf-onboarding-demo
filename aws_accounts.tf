module "my_subaccount" {
  source        = "./modules/aws-account"
  account_name  = "test-a"
  email_address = "test-a@codepro.uk"
  admin_users = [
    aws-sso-scim_user.user["hasitha@codepro.uk"].id,
    aws-sso-scim_user.user["demouser@codepro.uk"].id
  ]
  prismacloud_account_groups = [
#    prismacloud_account_group.test_group.group_id
  ]
}

module "test_account_2" {
  source        = "./modules/aws-account"
  account_name  = "test-a2"
  email_address = "test-a2@codepro.uk"
  admin_users = [
    aws-sso-scim_user.user["hasitha@codepro.uk"].id
  ]
  prismacloud_account_groups = [
#    prismacloud_account_group.test_group.group_id
  ]
}

module "demo1" {
  source        = "./modules/aws-account"
  account_name  = "demo1"
  email_address = "demo1@codepro.uk"
  admin_users = [
    aws-sso-scim_user.user["hasitha@codepro.uk"].id,
  ]
  prismacloud_account_groups = [
    prismacloud_account_group.test_group.group_id
  ]
}