# Czytanie z warstwy sieciowej
data "terraform_remote_state" "siec" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-tfstate-backend"
    storage_account_name = "tfstatejakub2026"
    container_name       = "tfstate"
    key                  = "siec.tfstate"
    use_azuread_auth     = true
    subscription_id      = "3cd5c8d8-3da0-4952-8fe9-3f3949c14a46"
  }
}

# Wywołanie modułu NSG
module "my_nsg" {
  source   = "../modules/nsg"
  nsg_name = "nsg-app-prod"
  location = "westeurope"
  # Grupa zasobów zaciagna z outputs pierwszego stanu
  resource_group_name = data.terraform_remote_state.siec.outputs.resource_group_name
  security_rules      = yamldecode(file("./firewall.yaml"))["rules"]
}

# Spiecie nsg z subnetem
resource "azurerm_subnet_network_security_group_association" "this" {

  subnet_id                 = data.terraform_remote_state.siec.outputs.subnet_id
  network_security_group_id = module.my_nsg.nsg_id
}
