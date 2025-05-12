resource "azurerm_container_app_environment" "container_app_environment" {
  name                           = var.c_app_env_name
  resource_group_name            = var.resource_group_name
  location                       = var.location
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  infrastructure_subnet_id       = var.subnet_id
  internal_load_balancer_enabled = false
  zone_redundancy_enabled        = false
 
  workload_profile {
    name                  = "Consumption"
    workload_profile_type = var.workload_profile_type
    minimum_count         = 1
    maximum_count         = 25
  }
  tags = var.tags
}

resource "azurerm_user_assigned_identity" "container_identity" {
  name                = var.container_identity_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags = var.tags
}

resource "azurerm_role_assignment" "containerapp" {
  scope                = var.container_registry_id
  role_definition_name = "acrpull"
  principal_id         = azurerm_user_assigned_identity.container_identity.principal_id
  depends_on = [
    azurerm_user_assigned_identity.container_identity
  ]
}

resource "azurerm_container_app" "container_app" {
  name                         = var.container_app_name
  container_app_environment_id = azurerm_container_app_environment.container_app_environment.id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"

  identity {
    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.container_identity.id
    ]
  }

  template {
    container {
      name   = var.container_name
      image  = var.container_image
      cpu    = var.container_cpu
      memory = var.container_app_memory
      command = var.container_command
      args = var.container_arguments
      /* readiness_probe {
        interval_seconds        = 10
        failure_count_threshold = 3
        transport               = "HTTP"
        port                    = 80
        path                    = "/api"
      } */
    }

    min_replicas = var.min_replicas
    max_replicas = var.max_replicas
    custom_scale_rule {
      name = "cpu-scale-rule" 
      custom_rule_type = "cpu"
      metadata = {
        value = "70"
      }
    }
  }
  ingress {
    external_enabled           = true # Disable public access
    allow_insecure_connections = false
    target_port                = 80
    transport                  = "http"

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }
  registry {
    server   = var.login_server
    identity = azurerm_user_assigned_identity.container_identity.id
  }
  tags = var.tags
}