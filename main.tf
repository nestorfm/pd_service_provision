# main.tf
terraform {
  required_providers {
    pagerduty = {
      source  = "PagerDuty/pagerduty"
      version = "~> 3.0"
    }
  }
}

provider "pagerduty" {
  token = var.pagerduty_token
}

# Create Business Service
resource "pagerduty_business_service" "main" {
  name        = var.business_service_name
  description = var.business_service_description
}

# Create Technical Services dynamically
resource "pagerduty_service" "technical_services" {
  for_each = { for idx, service in var.technical_services : idx => service }

  name                    = each.value.name
  description             = each.value.description
  escalation_policy       = data.pagerduty_escalation_policy.policies[each.key].id
  alert_creation          = each.value.alert_creation
  acknowledgement_timeout = each.value.acknowledgement_timeout
  auto_resolve_timeout    = each.value.auto_resolve_timeout
}

# Data source to fetch escalation policies
data "pagerduty_escalation_policy" "policies" {
  for_each = { for idx, service in var.technical_services : idx => service }
  name     = each.value.escalation_policy_name
}

# Attach Technical Services to Business Service
resource "pagerduty_service_dependency" "dependencies" {
  for_each = pagerduty_service.technical_services

  dependency {
    dependent_service {
      id   = pagerduty_business_service.main.id
      type = "business_service"
    }
    supporting_service {
      id   = each.value.id
      type = "service"
    }
  }
}