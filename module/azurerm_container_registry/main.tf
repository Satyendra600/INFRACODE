# resource "azurerm_container_registry" "acr" {
#   for_each            = var.acrs
#   name                = each.value.acr_name
#   resource_group_name = each.value.resource_group_name
#   location            = each.value.location
#   sku                 = each.value.sku

#   admin_enabled = each.value.admin_enabled
#   georeplications {
#     location                = each.value.location
#     zone_redundancy_enabled = each.value.zone_redundancy_enabled
#     tags                    = each.value.tags
#   }
# }

resource "azurerm_container_registry" "acr" {
  for_each            = var.acrs
  name                = each.value.acr_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku
  admin_enabled       = each.value.admin_enabled

  georeplications {
    location                = each.value.geo_location
    zone_redundancy_enabled = each.value.zone_redundancy_enabled
    tags                    = each.value.tags
  }

  tags = each.value.tags
}
