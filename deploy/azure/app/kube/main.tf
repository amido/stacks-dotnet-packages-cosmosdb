

# Naming convention
module "default_label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.16.0"
  namespace  = "${var.name_company}-${var.name_project}"
  stage      = var.stage
  name       = "${lookup(var.location_name_map, var.resource_group_location, "uksouth")}-${var.name_domain}"
  attributes = var.attributes
  delimiter  = "-"
  tags       = var.tags
}

##################################################
# ResourceGroups
##################################################

resource "azurerm_resource_group" "default" {
  name     = module.default_label.id
  location = var.resource_group_location
  tags     = module.default_label.tags
}

##################################################
# CosmosDB Resources
##################################################

module "cosmosdb" {
  source         = "git::https://github.com/amido/stacks-terraform//azurerm/modules/azurerm-cosmosdb?ref=v1.3.6"
  resource_namer = module.default_label.id
  resource_tags  = module.default_label.tags

  cosmosdb_sql_container               = var.cosmosdb_sql_container
  cosmosdb_sql_container_partition_key = var.cosmosdb_sql_container_partition_key
  cosmosdb_offer_type                  = var.cosmosdb_offer_type
  cosmosdb_kind                        = var.cosmosdb_kind

  resource_group_location = azurerm_resource_group.default.location
  resource_group_name     = azurerm_resource_group.default.name

  create_cosmosdb = true
}
