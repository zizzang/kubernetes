#!bin/bash

# Create Resource Group
az group create \
    --name dolphin \
    --location koreacentral
# Create VM
az vm create \
    --resource-group dolphin \
    --name node1 \
    --size Standard_D2s_v3 \
    --image UbuntuLTS \
    --location koreacentral \
    --storage-sku Standard_LRS \
    --authentication-type password \
    --admin-username dolphin \
    --admin-password Azuremsp12#$ \
    --public-ip-sku basic \
    --custom-data cloud-init.txt
# 80 Port Open
az vm open-port --resource-group dolphin --name master --port 80
