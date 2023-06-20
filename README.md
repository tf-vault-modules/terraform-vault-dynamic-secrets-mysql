<!-- BEGIN_TF_DOCS -->


<!-- markdownlint-disable MD001 -->
# How to use this module

```hcl
module "vault_dynamic_secret_mysql" {
  source = "../.."

  vault_mount_path = "database"
  db_username = "vault-user"
  db_password = "password"
  db_url = "mysql:3306"

  roles = [
    {
      role_name: "main"
      database_name: "wp-vault-test"
    },
    {
      role_name: "dnb"
      database_name: "wp-1"
    },
  ]
}
```

## Module Documentation

<!-- BEGIN\_TF\_DOCS -->
# TF-Modules: Dynamic Secrets (MySql)

| Deploys and configures MySql dynamic secrets engine in Hashicorp Vault with multiple roles.

[![tflint](https://github.com/tf-vault-modules/terraform-vault-dynamic-secrets-mysql/actions/workflows/tflint.yaml/badge.svg)](https://github.com/tf-vault-modules/terraform-vault-dynamic-secrets-mysql/actions/workflows/tflint.yaml)
[![tfsec](https://github.com/tf-vault-modules/terraform-vault-dynamic-secrets-mysql/actions/workflows/tfsec.yaml/badge.svg)](https://github.com/tf-vault-modules/terraform-vault-dynamic-secrets-mysql/actions/workflows/tfsec.yaml)
[![yamllint](https://github.com/tf-vault-modules/terraform-vault-dynamic-secrets-mysql/actions/workflows/yamllint.yaml/badge.svg)](https://github.com/tf-vault-modules/terraform-vault-dynamic-secrets-mysql/actions/workflows/yamllint.yaml)
[![misspell](https://github.com/tf-vault-modules/terraform-vault-dynamic-secrets-mysql/actions/workflows/misspell.yaml/badge.svg)](https://github.com/tf-vault-modules/terraform-vault-dynamic-secrets-mysql/actions/workflows/misspell.yaml)

[![Integration Tests](https://github.com/tf-vault-modules/terraform-vault-dynamic-secrets-mysql/actions/workflows/integration.yaml/badge.svg)](https://github.com/tf-vault-modules/terraform-vault-dynamic-secrets-mysql/actions/workflows/integration.yaml)

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | >= 3.10.0 |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_allowed_roles"></a> [allowed\_roles](#output\_allowed\_roles) | Dynamic Secret Role |
| <a name="output_backend"></a> [backend](#output\_backend) | Vault Dynamic Secret Engine |
| <a name="output_namespace"></a> [namespace](#output\_namespace) | Vault namespace |
| <a name="output_roles"></a> [roles](#output\_roles) | Dynamic Secret Role |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | The database VAULT ADMIN password to authenticate with | `string` | n/a | yes |
| <a name="input_db_url"></a> [db\_url](#input\_db\_url) | A URL containing connection information. See the Vault docs for an example. | `string` | n/a | yes |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | The database VAULT ADMIN username to authenticate with | `string` | n/a | yes |
| <a name="input_roles"></a> [roles](#input\_roles) | Roles | `any` | n/a | yes |
| <a name="input_allowed_roles"></a> [allowed\_roles](#input\_allowed\_roles) | Allowed roles | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_connection_name"></a> [connection\_name](#input\_connection\_name) | Connection name | `string` | `"mysql"` | no |
| <a name="input_default_creation_statements"></a> [default\_creation\_statements](#input\_default\_creation\_statements) | SQL Statements to be executed for creation | `list(string)` | <pre>[<br>  "CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';",<br>  "GRANT SELECT ON *.* TO '{{name}}'@'%';"<br>]</pre> | no |
| <a name="input_default_max_leases"></a> [default\_max\_leases](#input\_default\_max\_leases) | The maximum number of leases to be allowed by the quota rule. The max\_leases must be positive. | `number` | `"100"` | no |
| <a name="input_default_max_ttl"></a> [default\_max\_ttl](#input\_default\_max\_ttl) | Vault Namespace | `number` | `"600"` | no |
| <a name="input_default_rate_limit_block_interval"></a> [default\_rate\_limit\_block\_interval](#input\_default\_rate\_limit\_block\_interval) | If set, when a client reaches a rate limit threshold, the client will be prohibited from any further requests until after the 'block\_interval' in seconds has elapsed. | `number` | `"10"` | no |
| <a name="input_default_rate_limit_interval"></a> [default\_rate\_limit\_interval](#input\_default\_rate\_limit\_interval) | The duration in seconds to enforce rate limiting for | `number` | `"1"` | no |
| <a name="input_default_rate_limit_rate"></a> [default\_rate\_limit\_rate](#input\_default\_rate\_limit\_rate) | The maximum number of requests at any given second to be allowed by the quota rule. The rate must be positive. | `number` | `"10"` | no |
| <a name="input_default_renew_statements"></a> [default\_renew\_statements](#input\_default\_renew\_statements) | SQL Statements to be executed for renew | `list(string)` | `null` | no |
| <a name="input_default_revocation_statements"></a> [default\_revocation\_statements](#input\_default\_revocation\_statements) | SQL Statements to be executed for revocation | `list(string)` | `null` | no |
| <a name="input_default_rollback_statements"></a> [default\_rollback\_statements](#input\_default\_rollback\_statements) | SQL Statements to be executed for rollback | `list(string)` | `null` | no |
| <a name="input_default_ttl"></a> [default\_ttl](#input\_default\_ttl) | Vault Namespace | `number` | `240` | no |
| <a name="input_lease_count_enabled"></a> [lease\_count\_enabled](#input\_lease\_count\_enabled) | ENTERPRISE ONLY! Manage lease count quotas which enforce the number of leases that can be created. <br>A lease count quota can be created at the root level or defined on a namespace or mount by specifying a path when creating the quota | `bool` | `false` | no |
| <a name="input_max_connection_lifetime"></a> [max\_connection\_lifetime](#input\_max\_connection\_lifetime) | The maximum number of seconds to keep a connection alive for. | `number` | `null` | no |
| <a name="input_max_idle_connections"></a> [max\_idle\_connections](#input\_max\_idle\_connections) | The maximum number of idle connections to maintain. | `number` | `null` | no |
| <a name="input_max_open_connections"></a> [max\_open\_connections](#input\_max\_open\_connections) | The maximum number of open connections to use. | `number` | `null` | no |
| <a name="input_tls_ca"></a> [tls\_ca](#input\_tls\_ca) | x509 CA file for validating the certificate presented by the MySQL server. Must be PEM encoded. | `string` | `""` | no |
| <a name="input_tls_certificate_key"></a> [tls\_certificate\_key](#input\_tls\_certificate\_key) | x509 certificate for connecting to the database. This must be a PEM encoded version of the private key and the certificate combined | `string` | `""` | no |
| <a name="input_token_display_name"></a> [token\_display\_name](#input\_token\_display\_name) | Vault Token display name | `string` | `"dynamic-engine-vending-admin"` | no |
| <a name="input_vault_mount_path"></a> [vault\_mount\_path](#input\_vault\_mount\_path) | Database secret engine mount path | `string` | `"database"` | no |
| <a name="input_vault_namespace"></a> [vault\_namespace](#input\_vault\_namespace) | Vault Namespace | `string` | `"root"` | no |
end
<!-- END_TF_DOCS -->
