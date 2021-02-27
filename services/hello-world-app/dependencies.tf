data "terraform_remote_state" "db" {
  count   = var.mysql_config == null ? 1 : 0
  backend = "s3"
  config = {
    bucket = var.db_remote_state_bucket
    key    = var.db_remote_state_key
    region = "ap-southeast-1"
  }
}
data "aws_vpc" "default" {
  count   = var.vpc_id == null ? 1 : 0
  default = true
}

data "aws_subnet_ids" "default" {
  count  = var.subnet_ids == null ? 1 : 0
  vpc_id = local.vpc_id
}
