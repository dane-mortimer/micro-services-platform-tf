output "ecs_cluster_id" {
  description = "ID of the ECS cluster"
  value       = aws_ecs_cluster.main.id
}

output "service_connect_namespace_arn" {
  description = "ARN of the Service Discovery Namespace"
  value       = aws_service_discovery_private_dns_namespace.main.arn
}
