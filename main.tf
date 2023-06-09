variable "storage_account_name" {
    type=string
    default = "arjnn"
    description = "This is the prefix of the storage account name"
}

resource "azurerm_storage_account" "storageaccountresource" {
  name=join("",["${var.storage_account_name}",substr(random_uuid.storageaccountidentifier.result,0,8)])  
  resource_group_name      = "app-grp"
  location                 = "North Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
  depends_on = [
    azurerm_resource_group.appgrp,
    random_uuid.storageaccountidentifier
  ]
}

