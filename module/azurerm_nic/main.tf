# data "azurerm_subnet" "subnet" {
#   for_each            = var.nic
#   name                 = each.value.subnet_name
#   virtual_network_name = each.value.virtual_network_name
#   resource_group_name  = each.value.rg_name
# }

# output "subnet_id" {
#   value = {
#     for k, v in data.azurerm_subnet.subnet :
#     k => v.id
#   }
# }


# data "azurerm_public_ip" "pip" {
#   for_each            = var.nic
#   name                = each.value.pip_name
#   resource_group_name = each.value.rg_name
# }

# output "public_ip_address" {
#   value = {
#     for k, v in data.azurerm_public_ip.pip :
#     k => v.ip_address
#   }
# }


# resource "azurerm_network_interface" "nic" {
#   for_each            = var.nic
#   name                = each.value.nic_name
#   location            = each.value.location
#   resource_group_name = each.value.rg_name

#   ip_configuration {
#     name                          = each.value.ip_configuration_name
#     subnet_id                     = data.azurerm_subnet.subnet[each.key].id
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
#   }
# }

data "azurerm_subnet" "subnet" {
  for_each = var.nic

  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.rg_name
}

resource "azurerm_network_interface" "nic" {
  for_each = var.nic

  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = each.value.ip_configuration_name
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = each.value.pip_id
  }
}

output "nic_ids" {
  value = {
    for k, v in azurerm_network_interface.nic :
    k => v.id
  }
}
