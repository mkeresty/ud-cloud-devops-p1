# Udacity Cloud DevOps using Microsoft Azure
## Project 1: Deploying a Web Server in Azure

### Description
This repo utilizes Packer to create a vm image, and Terraform to deploy the web server in azure

### Dependencies
- Azure account
- Azure CLI
- Packer CLI
- Terraform CLI

### Set variables
1. Set environment variables with your Azure credentials
```
export ARM_CLIENT_ID=your_client_id
export ARM_CLIENT_SECRET=your_client_secret
export ARM_SUBSCRIPTION_ID=your_subscrition_id
```
2. Packer variables are set in ```./packer/server.json```
    - To edit Packer variables edit the ```./packer/server.json``` file
3. Terraform variables are set in ```./terraform/vars.tf```
    - To edit Terraform variables in ```./terraform/vars.tf``` you can change the ```default``` variable value, or apply the values when running terraform: ```terraform <args> --var="<variable_name>=<value>"```

__Note:__ ```managed_image_resource_group_name``` and ```managed_image_name``` in ```./packer/server.json``` should match ```packer_rg``` and ```packer_image_name``` in ```./terraform/vars.tf```. The tag name and value should also match across these files.


### Instructions
1. Log in to Azure CLI
```az login```
2. Deploy the policy which requires a tag on all Azure resources. This can be done via the portal or using the command which assigns the prebuilt policy: 
```az policy assignment create --name 'require-tag-assignment' --policy '871b6d14-10aa-478d-b590-94f262ecfa99' --params "{'tagName':{'value':'project'}}"```
3. Create your resource group ```Azuredevops``` in the portal or using the command:
```az group create --name Azuredevops --location southcentralus```



4. Create Packer image
 ```packer build ./packer/server.json```
5. Enter Terraform directory and initialize terraform
```
cd terraform
terraform init
```
__Note__:
If your resource group already exists you must import it:
```
terraform import azurerm_resource_group.main /subscriptions/{subscription-id}/resourceGroups/{resource-group-name}
```

6. Create the Terraform plan
```terraform plan -out "solution.plan"```
7. Deploy the terraform plan
```terraform apply "solution.plan"```
8. Destroy created resources
```terraform destroy```

## Attributions
[Terraform Docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)