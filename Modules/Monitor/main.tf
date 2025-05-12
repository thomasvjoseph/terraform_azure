# Create a Log Analytics workspace
resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags = var.tags
}

#  Enable VM Insights
/* resource "azurerm_virtual_machine_extension" "vm_insights" {
  name                 = "example-vm-insights"
  virtual_machine_id   = var.virtual_machine_id
  publisher            = "Microsoft.Azure.Monitoring.DependencyAgent"
  type                 = "DependencyAgentLinux"
  type_handler_version = "9.10"  # Use the latest version available
  auto_upgrade_minor_version = true
} */

# Configure CPU Usage Alerts
resource "azurerm_monitor_metric_alert" "cpu_alert" {
  name                = "high-cpu-usage-alert"
  resource_group_name = var.resource_group_name
  scopes              = [var.virtual_machine_id]
  description         = "This alert triggers when CPU usage exceeds 80%."

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
  }

  action {
    action_group_id = azurerm_monitor_action_group.email_notifications.id
  }
  
}

# Create an Action Group for Notifications
resource "azurerm_monitor_action_group" "email_notifications" {
  name                = "email-notifications"
  resource_group_name = var.resource_group_name
  short_name          = "emailnotify"

  email_receiver {
    name          = "admin-notification"
    email_address = "admin@example.com"
  }
}