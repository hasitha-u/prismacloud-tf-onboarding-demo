variable "account_name" {}
variable "email_address" {}
variable "prismacloud_account_groups" {}
variable "reader_users" {
  type    = list(string)
  default = []
}
variable "dev_users" {
  type    = list(string)
  default = []
}
variable "admin_users" {
  type    = list(string)
  default = []
}
