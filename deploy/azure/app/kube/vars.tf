variable "name_company" {
  type = string
}

variable "name_project" {
  type = string
}

variable "name_domain" {
  type = string
}

variable "stage" {
  type = string
}

# Each region must have corresponding a shortend name for resource naming purposes
variable "location_name_map" {
  type = map(string)

  default = {
    northeurope   = "eun"
    westeurope    = "euw"
    uksouth       = "uks"
    ukwest        = "ukw"
    eastus        = "use"
    eastus2       = "use2"
    westus        = "usw"
    eastasia      = "ase"
    southeastasia = "asse"
  }
}

variable "attributes" {
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}

############################################
# COSMOSDB INFORMATION
############################################

variable "cosmosdb_sql_container" {
  description = "Sql container name"
  type        = string
}

variable "cosmosdb_sql_container_partition_key" {
  description = "Partition key path, if multiple partition"
  type        = string
}

variable "cosmosdb_offer_type" {
  description = ""
  type        = string
}

variable "cosmosdb_kind" {
  description = ""
  type        = string
}

############################################
# RESOURCE INFORMATION
############################################

variable "resource_group_location" {
  type = string
}
