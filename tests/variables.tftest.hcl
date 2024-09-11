
# WARNING: Generated module tests should be considered experimental and be reviewed by the module author.

run "variables" {
  assert {
    condition     = var.mysql_host == "localhost"
    error_message = "incorrect mysql_host"
  }

  assert {
    condition     = var.mysql_username == "vault"
    error_message = "incorrect mysql_username"
  }

  assert {
    condition     = var.mysql_password == "password"
    error_message = "incorrect mysql_password"
  }

  assert {
    condition     = var.allowed_roles == ["role1", "role2"]
    error_message = "incorrect allowed_roles"
  }

  assert {
    condition     = var.db_name == "test_db"
    error_message = "incorrect db_name"
  }
}