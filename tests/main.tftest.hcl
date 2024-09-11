
# WARNING: Generated module tests should be considered experimental and be reviewed by the module author.

variables {
  mysql_host     = "localhost"
  mysql_username = "vault"
  mysql_password = "password"
  allowed_roles  = ["role1", "role2"]
  db_name        = "test_db"
}

run "vault_mount" {
  assert {
    condition     = vault_mount.mysql.path == "mysql"
    error_message = "incorrect path"
  }

  assert {
    condition     = vault_mount.mysql.type == "database"
    error_message = "incorrect type"
  }
}

run "vault_database_secret_backend_connection" {
  assert {
    condition     = vault_database_secret_backend_connection.mysql.backend == vault_mount.mysql.path
    error_message = "incorrect backend"
  }

  assert {
    condition     = vault_database_secret_backend_connection.mysql.plugin_name == "mysql-database-plugin"
    error_message = "incorrect plugin_name"
  }

  assert {
    condition     = vault_database_secret_backend_connection.mysql.name == "mysql"
    error_message = "incorrect name"
  }

  assert {
    condition     = vault_database_secret_backend_connection.mysql.allowed_roles == var.allowed_roles
    error_message = "incorrect allowed_roles"
  }

  assert {
    condition     = vault_database_secret_backend_connection.mysql.mysql.connection_url == "{{username}}:{{password}}@tcp(${var.mysql_host}:3306)/"
    error_message = "incorrect connection_url"
  }

  assert {
    condition     = vault_database_secret_backend_connection.mysql.mysql.username == var.mysql_username
    error_message = "incorrect username"
  }

  assert {
    condition     = vault_database_secret_backend_connection.mysql.mysql.password == var.mysql_password
    error_message = "incorrect password"
  }

  assert {
    condition     = vault_database_secret_backend_connection.mysql.mysql.username_template == "vault-mysql-{{random 3}}"
    error_message = "incorrect username_template"
  }
}

run "vault_database_secret_backend_role" {
  assert {
    condition     = vault_database_secret_backend_role.mysql_dynamic_creds.backend == vault_mount.mysql.path
    error_message = "incorrect backend"
  }

  assert {
    condition     = vault_database_secret_backend_role.mysql_dynamic_creds.name == "mysql_dynamic_creds"
    error_message = "incorrect name"
  }

  assert {
    condition     = vault_database_secret_backend_role.mysql_dynamic_creds.db_name == vault_database_secret_backend_connection.mysql.name
    error_message = "incorrect db_name"
  }

  assert {
    condition     = vault_database_secret_backend_role.mysql_dynamic_creds.creation_statements == ["CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT ALL ON ${var.db_name}.* TO '{{name}}'@'%';"]
    error_message = "incorrect creation_statements"
  }

  assert {
    condition     = vault_database_secret_backend_role.mysql_dynamic_creds.revocation_statements == ["DROP USER '{{name}}'@'%';"]
    error_message = "incorrect revocation_statements"
  }

  assert {
    condition     = vault_database_secret_backend_role.mysql_dynamic_creds.default_ttl == "300"
    error_message = "incorrect default_ttl"
  }
}

run "vault_database_secret_backend_static_role" {
  assert {
    condition     = vault_database_secret_backend_static_role.mysql_static_role.backend == vault_mount.mysql.path
    error_message = "incorrect backend"
  }

  assert {
    condition     = vault_database_secret_backend_static_role.mysql_static_role.name == "mysql_static_role"
    error_message = "incorrect name"
  }

  assert {
    condition     = vault_database_secret_backend_static_role.mysql_static_role.db_name == vault_database_secret_backend_connection.mysql.name
    error_message = "incorrect db_name"
  }

  assert {
    condition     = vault_database_secret_backend_static_role.mysql_static_role.username == "dbadmin"
    error_message = "incorrect username"
  }

  assert {
    condition     = vault_database_secret_backend_static_role.mysql_static_role.rotation_period == 600
    error_message = "incorrect rotation_period"
  }

  assert {
    condition     = vault_database_secret_backend_static_role.mysql_static_role.rotation_statements == ["ALTER USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';"]
    error_message = "incorrect rotation_statements"
  }
}