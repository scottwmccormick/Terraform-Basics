#Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.96.0"
    }
  }
}

#configure the Microsoft Azure Provider
provider "azurerm" {
  # Configuration options
}

#create a resource group
resource "azurerm_resource_group" "myrg" {
    name = "cairnconsult-rg"
    location = "UK South"
  
}

#create a virtual network within the resource group
resource "azurerm_virtual_network" "myvnet" {
    name = "cairnconsult-vnet"
    resource_group_name = azurerm_resource_group.myrg.name
    location = azurerm_resource_group.myrg.location
    address_space = [ "10.0.0.0/16" ]
  
}

#create a subnet within the vnet
resource "azurerm_subnet" "mysubnet" {
    name = "cairnconsult-subnet"
    resource_group_name = azurerm_resource_group.myrg
    virtual_network_name = azurerm_virtual_network.myvnet.name
    address_prefixes = [ "10.0.1.0/24" ]
  
}

