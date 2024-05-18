data "aws_caller_identity" "current" {}

module "single_zone" {
  source  = "RJPearson94/open-next/aws//modules/tf-aws-open-next-zone"
  version = ">= 2.0.0, < 3.0.0"

  prefix      = "open-next-${data.aws_caller_identity.current.account_id}"
  folder_path = "./.open-next"
  providers = {
    aws.dns             = aws.dns
    aws.global          = aws.global
    aws.iam             = aws.iam
    aws.server_function = aws.server_function
  }
}