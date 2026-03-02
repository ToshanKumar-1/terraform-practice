resource "azurerm_resource_group" "this" {
  name     = "rg-example"
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = "demostorageacc234ert"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_network_security_group" "example" {
  name = "example-security-group"
  location = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
}

resource "azurerm_virtual_network" "vnet" {
  name = "example-network"
  location = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet1" {
  name = "subnet1"
  resource_group_name = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  name = "subnet2"
  resource_group_name = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = ["10.0.2.0/24"]
}

resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id = azurerm_subnet.subnet2.id
  network_security_group_id = azurerm_network_security_group.example.id
}