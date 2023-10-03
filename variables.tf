variable "mysql_host" {
  description = "Hostname or IP of MySQL server"
  type        = string
}

variable "mysql_username" {
  description = "Username for MySQL admin user"
  type        = string
  default     = "vault"
}

variable "mysql_password" {
  description = "Password for MySQL admin user"
  type        = string
  sensitive   = true
}

variable "allowed_roles" {
  description = "List of roles allowed to connect to DB secrets backend"
  type        = list(string)
}

variable "db_name" {
  description = "Name of the database configured in the backend role"
  type        = string
}