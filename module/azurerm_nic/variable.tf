variable "nic" {
  type = map(object({
    nic_name                  = string
    location              = string
    rg_name   = string
    virtual_network_name = string
    subnet_name = string
    pip_name = string
    ip_configuration_name = string
    
    }))

  }