module "rgs" {
  source = "../../module/resource_group"
  rgs    = var.rgs

}
module "stgs" {
  source = "../../module/storage_account"
  stgs   = var.stgs
}
module "acrs" {
  source = "../../module/azurerm_container_registry"
  acrs   = var.acrs
}

module "vnet" {
  source = "../../module/virtual_network"
  vnets  = var.vnets

}
module "subnets" {
  depends_on = [module.vnet]
  source     = "../../module/subnet"
  subnets    = var.subnets

}


module "pip" {
  depends_on = [module.rgs]
  source     = "../../module/azurerm_pip"
  pip        = var.pip
}

module "nic" {
  depends_on = [module.pip, module.subnets]
  source     = "../../module/azurerm_nic"
  nic        = var.nic
}

module "vms" {
  depends_on = [module.subnets]
  source     = "../../module/vm"
  vms        = var.vms
}



# module "key_vault" {
#   source    = "../../module/azurerm_keyvault"
#   key_vault = var.key_vault
# }
module "key_vault" {
  source    = "../../module/azurerm_keyvalult"
  key_vault = var.key_vault
}


module "sql_server" {
  source     = "../../module/sql_server"
  sql_server = var.sql_server
}



module "sql_database" {
  source       = "../../module/sql_database"
  sql_database = var.sql_database
}
