
# WARNING: Generated module tests should be considered experimental and be reviewed by the module author.

run "provider" {
  assert {
    condition     = terraform.required_providers.vault.source == "hashicorp/vault"
    error_message = "incorrect provider source"
  }

  assert {
    condition     = terraform.required_providers.vault.version == ">= 3.20.1"
    error_message = "incorrect provider version"
  }
}