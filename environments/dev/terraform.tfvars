rg_todo = {
  rg_todo_app = {
    rg_name    = "rg-todo-app-dev"
    location   = "Canada Central"
    managed_by = "pradum"
    tags = {
      Environment = "Development"
      Project     = "todoapp"
      Owner       = "devops-team"
    }
  }
    rg_todo_app1 = {
    rg_name    = "rg-todo-app-dev1"
    location   = "Canada Central"
    managed_by = "pradum"
    tags = {
      Environment = "Development"
      Project     = "todoapp"
      Owner       = "devops-team"
    }
  }
    rg_todo_app2 = {
    rg_name    = "rg-todo-app-dev2"
    location   = "Canada Central"
    managed_by = "pradum"
    tags = {
      Environment = "Development"
      Project     = "todoapp"
      Owner       = "devops-team"
    }
  }
    rg_todo_app3 = {
    rg_name    = "rg-todo-app-dev3"
    location   = "Canada Central"
    managed_by = "pradum"
    tags = {
      Environment = "Development"
      Project     = "todoapp"
      Owner       = "devops-team"
    }
  }  
}

todo_app_vnet_sub = {
  todo_vnet = {
    vnet_name           = "vnet-todo-app-dev"
    location            = "Canada Central"
    resource_group_name = "rg-todo-app-dev"
    address_space       = ["10.0.0.0/16"]

    tags = {
      Environment = "Development"
      Project     = "todoapp"
      Owner       = "devops-team"
    }

    subnets = {
      frontend-sub-dev = {
        subnet_name      = "frontend-sub-dev"
        address_prefixes = ["10.0.1.0/24"]
      }
      backend-sub-dev = {
        subnet_name      = "backend-sub-dev"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}

todo_app_nsg = {
  frontend_nsg = {
    nsg_name            = "todo-frontend-nsg-dev"
    location            = "Canada Central"
    resource_group_name = "rg-todo-app-dev"

    security_rules = [
      {
        name                       = "todo-frontend-allow-dev-inbound"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]

    tags = {
      Environment = "Development"
      Project     = "todoapp"
      Owner       = "devops-team"
    }
  }

  backend_nsg = {
    nsg_name            = "todo-backend-nsg-dev"
    location            = "Canada Central"
    resource_group_name = "rg-todo-app-dev"

    security_rules = [
      {
        name                       = "todo-backend-allow-dev-outbound"
        priority                   = 100
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]

    tags = {
      Environment = "Development"
      Project     = "todoapp"
      Owner       = "devops-team"
    }
  }
}

todo_public_ip = {
  todo_frontend_pip = {
    pip_name            = "todo-frontend-pip-dev"
    resource_group_name = "rg-todo-app-dev"
    location            = "Canada Central"
    sku                 = "Standard"
    allocation_method   = "Static"
    ip_version          = "IPv4"
    tags = {
      Environment = "Development"
      Project     = "todoapp"
      Owner       = "devops-team"
    }
  }

  todo_backend_pip = {
    pip_name            = "todo-backend-pip-dev"
    resource_group_name = "rg-todo-app-dev"
    location            = "Canada Central"
    sku                 = "Standard"
    allocation_method   = "Static"
    ip_version          = "IPv4"
    tags = {
      Environment = "Development"
      Project     = "todoapp"
      Owner       = "devops-team"
    }
  }
}

network_interface = {
  todo_nic = {
    nic_name            = "nic-todo-app-dev"
    location            = "Canada Central"
    resource_group_name = "rg-todo-app-dev"
    vnet_key            = "todo_vnet"

    tags = {
      Environment = "Development"
      Project     = "todoapp"
      Owner       = "devops-team"
    }

    ip_configurations = {
      frontend_ipconfig = {
        name                          = "ipconfig-frontend"
        private_ip_address_allocation = "Dynamic"
        subnet_key                    = "frontend-sub-dev"
        public_ip_address_id          = null
      }
    }
  }

  todo_backend_nic = {
    nic_name            = "nic-todo-backend-dev"
    location            = "Canada Central"
    resource_group_name = "rg-todo-app-dev"
    vnet_key            = "todo_vnet"

    tags = {
      Environment = "Development"
      Project     = "todoapp"
      Owner       = "devops-team"
    }

    ip_configurations = {
      backend_ipconfig = {
        name                          = "ipconfig-backend"
        private_ip_address_allocation = "Dynamic"
        subnet_key                    = "backend-sub-dev"
        public_ip_address_id          = null
      }
    }
  }
}

virtual_machine = {
  frontend_vm = {
    vm_name             = "todo-vm-frontend"
    resource_group_name = "rg-todo-app-dev"
    location            = "Canada Central"
    vm_size             = "Standard_D2s_v3"
    admin_username      = "Pradum9754"
    admin_password      = "Praboss@9754020"
    nic_key             = "todo_nic"

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

  source_image_reference = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  }

  backend_vm = {
    vm_name             = "todo-vm-backend"
    resource_group_name = "rg-todo-app-dev"
    location            = "Canada Central"
    vm_size             = "Standard_D2s_v3"
    admin_username      = "Pradum9754"
    admin_password      = "Praboss@9754020"
    nic_key             = "todo_backend_nic"

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

  source_image_reference = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  }
}
