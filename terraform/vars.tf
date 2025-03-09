
variable "prefix" {
  description = "The prefix which should be used for all resources."
  default = "ud"
}

variable "location" {
  description = "The Azure Region in which all resources will be created."
  default = "southcentralus"
}

variable "admin_username" {
  description = "The admin username for the VM being created."
  default = "udacity"
}

variable "admin_password" {
  description = "The password for the VM being created."
  default = "Password123!"
}

variable "subscription_id" {
  description = "The Azure subscription ID"
  default = "a3a536c2-3690-4c5f-8032-998a8dc3234e"
}

variable "packer_image_name" {
  description = "Image name deployed by packer."
  default = "ud_project_1"
}

variable "packer_rg" {
  description = "Resource group associated with the Packer image."
  default = "Azuredevops"
}

variable "vm_count" {
  description = "Number of virtual machines to be deployed."
  default = 2
}

variable "tag_name" {
  description = "Tag name required on all resources."
  default = "project"
}

variable "tag_value" {
  description = "Tag value required on all resources."
  default = "project_1"
}