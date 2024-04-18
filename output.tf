output "cluster_id" {
  description = "EKS cluster ID."
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane."
  value       = module.eks.cluster_security_group_id
}

output "region" {
  description = "AWS region"
  value       = var.aws_region
}

output "oidc_provider_arn" {
  value = module.eks.oidc_provider_arn
}

output "cloudwatch_composite_alarm_arn" {
  description = "The ARN of the Cloudwatch composite alarm"
  value       = module.composite_alarm.cloudwatch_composite_alarm_arn
}

output "cloudwatch_composite_alarm_id" {
  description = "The ID of the Cloudwatch composite alarm"
  value       = module.composite_alarm.cloudwatch_composite_alarm_id
}

output "lambda_function1_arn" {
  description = "Lambda function ARN"
  value       = module.aws_lambda_function1.lambda_function_arn
}

output "lambda_function1_name" {
  description = "Lambda function name"
  value       = module.aws_lambda_function1.lambda_function_name
}