variable "roles" {

}

variable "connection_name" {
  default = "mysql"
}

variable "allowed_roles" {
  default = ["*"]
}

# db
variable "db_url" {
  description = "A URL containing connection information. See the Vault docs for an example."
}

variable "db_username" {
  description = "The database VAULT ADMIN username to authenticate with"
}

variable "db_password" {
  description = "The database VAULT ADMIN password to authenticate with"
}

variable "vault_namespace" {
  default = "root"
  description = "Vault Namespace"
}

variable "vault_mount_path" {
  description = "Vault Token display name"
}

variable "token_display_name" {
  default     = "dynamic-engine-vending-admin"
  description = "Vault Token display name"
}

variable "default_ttl" {
  default = 240
  type = number
  description = "Vault Namespace"
}

variable "default_max_ttl" {
  default = "600"
  type = number
  description = "Vault Namespace"
}


variable "default_max_leases" {
  default = "100"
  type = number
  description = "The maximum number of leases to be allowed by the quota rule. The max_leases must be positive."
}

variable "default_rate_limit_rate" {
  default = "10"
  type = number
  description = "The maximum number of requests at any given second to be allowed by the quota rule. The rate must be positive."
}

variable "default_rate_limit_interval" {
  default = "1"
  type = number
  description = "The duration in seconds to enforce rate limiting for"
}

variable "default_rate_limit_block_interval" {
  default = "10"
  type = number
  description = "If set, when a client reaches a rate limit threshold, the client will be prohibited from any further requests until after the 'block_interval' in seconds has elapsed."
}
