resource "azurerm_app_service_plan" "example" {
  name                = "my-appservice-plan"
  location            = "West US"
  resource_group_name = azurerm_resource_group.example.name
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "example" {
  name                = "my-appservice"
  location            = "West US"
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    app_command_line = ""
    dotnet_framework_version = ""
    # Other configuration options
  }

  app_settings = {
    "key1" = "value1"
    "key2" = "value2"
  }
}
