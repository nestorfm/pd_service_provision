# outputs.tf
output "business_service_id" {
  description = "ID of the created business service"
  value       = pagerduty_business_service.main.id
}

output "business_service_name" {
  description = "Name of the created business service"
  value       = pagerduty_business_service.main.name
}

output "technical_services" {
  description = "Map of created technical services"
  value = {
    for key, service in pagerduty_service.technical_services : key => {
      id   = service.id
      name = service.name
    }
  }
}