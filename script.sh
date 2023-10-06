# This script create all dependencies such as AzureRG, App service plan and Set deployment source as GitHub
# It also deploy Webapp
#!/bin/bash
# Create Azure Resounces
Resource_Group_Name=testRG
APPSERVICE_PLAN_NAME=my-app-plan$RANDOM
webapp_NAME=my-web-app$RANDOM
deployment_source=https://github.com/Azure-Samples/html-docs-hello-world
Location=UKSouth
# Create an App Service Plan
az appservice plan create --name $APPSERVICE_PLAN_NAME --resource-group $Resource_Group_Name --location $Location --SKU f1
# create a web app
az webapp create --name $webapp_NAME --plan $APPSERVICE_PLAN_NAME --resource-group $Resource_Group_Name 
#Deploy an app from GitHub to Azure App service
az webapp deployment source config --repo-url $deployment_source --branch master --manual-integration -name $webapp_NAME --resource-group $Resource_Group_Name
