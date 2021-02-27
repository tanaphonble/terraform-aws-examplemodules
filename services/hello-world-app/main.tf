locals {
  vpc_id = (
    var.vpc_id == null
    ? data.aws_vpc.default[0].id
    : var.vpc_id
  )

  subnet_ids = (
    var.subnet_ids == null
    ? data.aws_subnet_ids.default[0].ids
    : var.subnet_ids
  )

  mysql_config = (
    var.mysql_config == null
    ? data.terraform_remote_state.db[0].outputs
    : var.mysql_config
  )
}
