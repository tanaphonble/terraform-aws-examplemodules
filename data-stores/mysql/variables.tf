variable "identifier_prefix" {
  description = "The identifier prefix"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "db_username" {
  description = "The database username"
  type        = string
}

variable "db_password" {
  description = "The database password"
  type        = string
}

variable "db_instance_class" {
  description = "The class of the instance to use for the database (e.g. db.t2.micro)"
  type        = string
}
