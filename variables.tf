# variables.tf
variable "pagerduty_token" {
  description = "PagerDuty API token"
  type        = string
  sensitive   = true
}

variable "business_service_name" {
  description = "Name of the business service"
  type        = string
  default     = "Main Business Service"
}

variable "business_service_description" {
  description = "Description of the business service"
  type        = string
  default     = "Primary business service for technical services"
}

variable "technical_services" {
  description = "List of technical services to create"
  type = list(object({
    name                    = string
    description             = string
    escalation_policy_name  = string
    alert_creation          = string
    acknowledgement_timeout = number
    auto_resolve_timeout    = number
  }))
  default = [
    {
      name                    = "API Service"
      description             = "API technical service"
      escalation_policy_name  = "Default"
      alert_creation          = "create_alerts_and_incidents"
      acknowledgement_timeout = 600
      auto_resolve_timeout    = 14400
    },
    {
      name                    = "Database Service"
      description             = "Database technical service"
      escalation_policy_name  = "Default"
      alert_creation          = "create_alerts_and_incidents"
      acknowledgement_timeout = 600
      auto_resolve_timeout    = 14400
    }
  ]
}