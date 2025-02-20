output "load_balancer_security_group_id" {
  description = "Load balancer security group ID"
  value       = aws_security_group.this.id
}

output "load_balancer_target_group_arn" {
  description = "Load balancer security group ID"
  value       = aws_lb_target_group.this.id
}
