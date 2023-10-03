<!-- BEGIN_TF_DOCS -->
## Requirements

None

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | 3.20.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_database_secret_backend_connection.mysql](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/database_secret_backend_connection) | resource |
| [vault_database_secret_backend_role.mysql_dynamic_creds](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/database_secret_backend_role) | resource |
| [vault_database_secret_backend_static_role.mysql_static_role](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/database_secret_backend_static_role) | resource |
| [vault_mount.mysql](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_roles"></a> [allowed\_roles](#input\_allowed\_roles) | List of roles allowed to connect to DB secrets backend | `list(string)` | n/a | yes |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | Name of the database configured in the backend role | `string` | n/a | yes |
| <a name="input_mysql_host"></a> [mysql\_host](#input\_mysql\_host) | Hostname or IP of MySQL server | `string` | n/a | yes |
| <a name="input_mysql_password"></a> [mysql\_password](#input\_mysql\_password) | Password for MySQL admin user | `string` | n/a | yes |
| <a name="input_mysql_username"></a> [mysql\_username](#input\_mysql\_username) | Username for MySQL admin user | `string` | `"vault"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
