# tf-playground
My tf playground

# 1. Tworzymy grupę zasobów dla backendu
az group create --name rg-tfstate-backend --location westeurope

# 2. Tworzymy Storage Account
az storage account create --resource-group rg-tfstate-backend --name tfstatejakub2026 --sku Standard_LRS --allow-blob-public-access false

# 3. Tworzymy kontener na pliki stanu
az storage container create --name tfstate --account-name tfstatejakub2026 --auth-mode login