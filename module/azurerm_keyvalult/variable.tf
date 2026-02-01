# variable "key_vault" {
#     type = map(object({
#   name                        = string
#   location                    = string
#   resource_group_name         = string
#   enabled_for_disk_encryption = bool
#   tenant_id                   = number
#   soft_delete_retention_days  = bool
#   purge_protection_enabled    = string

#   sku_name = string
#     }))
  
# }

variable "key_vault" {
  type = map(object({
    kv_name  = string
    location = string
    rg_name  = string
  }))
}
