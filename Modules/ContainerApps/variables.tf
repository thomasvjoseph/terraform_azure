variable "location" {
  type        = string
  description = "The location of the resource in Azure"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which the container registry will be created"
}

variable "c_app_env_name" {
  type        = string
  description = "The name of the container app environment"
}
 
variable "workload_profile_type" {
  type        = string
  description = "The workload profile type for the container app environment"
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "The ID of the log analytics workspace"
}

variable "subnet_id" {
  type        = string
  description = "The Subnet"
  default     = null
}

variable "container_identity_name" {
  type        = string
  description = "The name of the container identity"
}

variable "container_app_name" {
  type        = string
  description = "The name of the container app"
}

variable "container_registry_id" {
  type        = string
  description = "The ID of the container registry"
  
}

variable "container_name" {
  type        = string
  description = "The name of the container"
}

variable "container_image" {
  type        = string
  description = "The image of the container"
}

variable "container_cpu" {
  type        = number
  description = "The CPU of the container"
}

variable "container_app_memory" {
  type        = string
  description = "The memory of the container app"
}

variable "min_replicas" {
  type        = number
  description = "The minimum number of replicas for the container app"
  default = 1
  validation {
    condition     = var.min_replicas >= 1
    error_message = "The minimum number of replicas must be at least 1."
  }
}

variable "max_replicas" {
  type        = number
  description = "The maximum number of replicas for the container app"
  default = 5
  validation {
    condition     = var.max_replicas >= 1
    error_message = "The maximum number of replicas must be at least 1."
  }
}

/* variable "container_port" {
  type        = number
  description = "The port of the container"
}

variable "container_path" {
  type        = string
  description = "The path of the container"
} */

variable "ingress_enabled" {
  type        = bool
  description = "Indicates if the container app is enabled for ingress"
  #Setting external_enabled to false indeed limits access to the “Container Apps Environment” (meaning the VNet it is attached to, if configured)
  #With this setup, your Application Gateway can manage the public ingress while the Container App only accepts traffic from the Application Gateway within the VNet.
  default = false
  validation {
    condition     = var.ingress_enabled == true || var.ingress_enabled == false
    error_message = "The ingress must be either true or false."
  }
}

variable "login_server" {
  type        = string
  description = "The login server of the Azure Container Registry"
}

variable "container_command" {
  type        = list(string)
  description = "The command to run in the container"
  default     = []
}

variable "container_arguments" {
  type        = list(string)
  description = "The arguments to pass to the container command"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Tags for the container app"
  default     = {}
}