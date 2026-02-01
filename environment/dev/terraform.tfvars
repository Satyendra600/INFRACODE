rgs = {
  rg1 = {
    rg_name    = "satya_rg"
    location   = "centralindia"
    managed_by = "Terraform"
    tags = {
      env = "dev"
    }
  }
}

stgs = {
  stg1 = {
    name                     = "satyastg"
    resource_group_name      = "satya_rg"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}

vnets = {
  vnet1 = {
    vnet_name           = "satyavnet"
    location            = "centralindia"
    resource_group_name = "satya_rg"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["10.0.0.4", "10.0.0.5"]
  }
}

subnets = {
  subnet1 = {
    subnet_name          = "satyasubnet"
    resource_group_name  = "satya_rg"
    virtual_network_name = "satyavnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
}

vms = {
  vm1 = {
    vm_name                       = "satyavm"
    resource_group_name           = "satya_rg"
    location                      = "Central India"
    size                          = "Standard_B1s"
    ip_configuration_name         = "satyaip"
    nic_name                      = "satyanic"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "satyasubnet"
    virtual_network_name          = "satyavnet"

    admin_username = "azureuser"
    admin_password = "P@ssword1234!"

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

# acrs = {
#   acr1 = {
#     acr_name                = "satyaacr"
#     resource_group_name     = "satya_rg"
#     location                = "centralindia"
#     sku                     = "Premium"
#     admin_enabled           = true
#     location                = "East US"
#     zone_redundancy_enabled = true
#     tags = {
#       env   = "dev"
#       owner = "satya"
#     }
#   }
# }

acrs = {
  acr1 = {
    acr_name                = "satyaacr"
    resource_group_name     = "satya_rg"
    location                = "centralindia"
    geo_location            = "eastus"
    sku                     = "Premium"
    admin_enabled           = true
    zone_redundancy_enabled = true

    tags = {
      env   = "dev"
      owner = "satya"
    }
  }
}

pip = {
  pip1 = {
    pip_name            = "satyapip"
    resource_group_name = "satya_rg"
    location            = "centralindia"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

nic = {
  nic1 = {
    nic_name              = "satyanic"
    location              = "centralindia"
    rg_name               = "satya_rg"
    virtual_network_name  = "satyavnet"
    subnet_name           = "satyasubnet"
    ip_configuration_name = "ipconfig1"
    pip_id                = "/4e493fc5-13ea-4fbe-a07e-6bab83bb95b7/xxxx/resourceGroups/satya_rg/providers/Microsoft.Network/publicIPAddresses/satyapip"
  }
}

key_vault = {
  kv1 = {
    kv_name  = "satyakv"
    location = "centralindia"
    rg_name  = "satya_rg"
  }
}

sql_server = {
  sql1 = {
    name                         = "satyasqlserver"
    resource_group_name          = "satya_rg"
    location                     = "centralindia"
    version                      = "12.0"
    administrator_login          = "satyaadmin"
    administrator_login_password = "Satya@12345!"
    minimum_tls_version          = "1.2"

    azuread_administrator = {
      login_username = "satya@tenant.onmicrosoft.com"
      object_id      = "00000000-0000-0000-0000-000000000000"
    }

    environment = "dev"
  }
}

sql_database = {
  db1 = {
    name         = "satyadb"
    server_id    = "/subscriptions/4e493fc5-13ea-4fbe-a07e-6bab83bb95b7/resourceGroups/satya_rg/providers/Microsoft.Sql/servers/satya-sql-server"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 2
    sku_name     = "Basic"
    enclave_type = "Default"
  }
}

