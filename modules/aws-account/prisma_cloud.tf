# resource "random_uuid" "external_id" {
# }

# module "pc_role" {
#   providers = {
#     aws = aws.sub-account
#   }

#   #source        = "./prismacloud_aws_role"
#   source = "github.com/hasitha-u/terraform-prismacloud-aws-role"
#   account_type = "standard"
#   protection_mode = "MONITOR"
#   external_id = random_uuid.external_id.result
# }


# resource "prismacloud_cloud_account" "this" {
#     # disable_on_destroy = true
#     aws {
#         name = aws_organizations_account.account.name
#         account_id = aws_organizations_account.account.id
#         external_id = random_uuid.external_id.result
#         group_ids = var.prismacloud_account_groups
#         role_arn = module.pc_role.role_arn
#     }
# }