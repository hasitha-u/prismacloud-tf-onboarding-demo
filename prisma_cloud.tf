resource "prismacloud_account_group" "test_group" {
  name        = "TEST_GROUP"
  description = "Made by Terraform"
  lifecycle {
    ignore_changes = [
      account_ids,
    ]
  }
}

resource "prismacloud_user_role" "test_group_role" {
  name              = "test"
  description       = "Made by Terraform"
  role_type         = "Account Group Admin"
  account_group_ids = [prismacloud_account_group.test_group.group_id]
}