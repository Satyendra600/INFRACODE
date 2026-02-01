# variable "acrs" {
#   type = map(object({
#     acr_name                = string
#     resource_group_name     = string
#     location                = string
#     sku                     = string
#     admin_enabled           = bool
#     zone_redundancy_enabled = bool
#     tags                    = map(string)
#     env                     = string
#   }))
# }
    
variable "acrs" {
  type = map(object({
    acr_name                = string
    resource_group_name     = string
    location                = string
    geo_location            = string
    sku                     = string
    admin_enabled           = bool
    zone_redundancy_enabled = bool
    tags                    = map(string)
  }))
}

