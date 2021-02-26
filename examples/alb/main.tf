terraform {
  required_providers {
    aws = {
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}


module "alb" {
  source = "../../networking/alb"

  alb_name   = "alb-terratest"
  subnet_ids = data.aws_subnet_ids.default.ids
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "unit" {
  name = "alb_terratest"
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}
