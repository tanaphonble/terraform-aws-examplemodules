variable "db_password" {
  description = "The password for the database"
  type        = string
}

variable "server_text" {
  description = "The text the web server should return"
  default     = "Hello, World"
  type        = string
}

variable "environment" {
  description = "the name of the environment we're deploy to"
  type        = string
  default     = "example"
}


variable "db_name" {
  description = "The name to use for the database"
  type        = string
  default     = "example_database"
}

variable "db_username" {
  description = "The username for the database"
  type        = string
  default     = "admin"
}

variable "mysql_config" {
  description = "The config for the MySQL DB"
  type = object({
    address = string
    port    = number
  })

  default = {
    address = "mock-mysql-address"
    port    = 12345
  }
}
