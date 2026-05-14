# tf-playground
My tf playground

# 1. Tworzymy grupę zasobów dla backendu
az group create --name rg-tfstate-backend --location westeurope

# 2. Tworzymy Storage Account
az storage account create --resource-group rg-tfstate-backend --name tfstatejakub2026 --sku Standard_LRS --allow-blob-public-access false

# 3. Tworzymy kontener na pliki stanu
az storage container create --name tfstate --account-name tfstatejakub2026 --auth-mode login

# 4. Pobierz swój object id
az ad signed-in-user show --query id -o tsv

# 5. Nadaj prawa do odczytu stanu
az role assignment create \
  --role "Storage Blob Data Contributor" \
  --assignee <OBJECT_ID> \
  --scope /subscriptions/<SUB_ID>/resourceGroups/rg-tfstate-backend/providers/Microsoft.Storage/storageAccounts/tfstatejakub2026