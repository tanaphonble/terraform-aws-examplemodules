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

module "hello_world_app" {
  source = "../../../services/hello-world-app"

  server_text = var.server_text

  environment = var.environment

  mysql_config = var.mysql_config

  instance_type      = "t2.micro"
  min_size           = 1
  max_size           = 1
  enable_autoscaling = false
}

module "mysql" {
  source = "../../../data-stores/mysql"

  identifier_prefix = "terratest-db"
  db_name           = var.db_name
  db_username       = var.db_username
  db_password       = var.db_password
  db_instance_class = "db.t2.micro"
}
