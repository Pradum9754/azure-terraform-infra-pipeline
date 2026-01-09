terraform {
  backend "azurerm" {
    resource_group_name  = "rg-app-dev" 
    storage_account_name = "devstorage12"                                 
    container_name       = "devcontainer"                                  
    key                  = "dev.tfstate"                   
}
}