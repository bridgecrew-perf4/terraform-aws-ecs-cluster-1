#TODO! Need complete refactor
# # Cloudwatch alarm that triggers the autoscaling up policy
# resource "aws_cloudwatch_metric_alarm" "service_cpu_high" {
#   alarm_name          = "portal_cpu_utilization_high"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = "2"
#   metric_name         = "CPUUtilization"
#   namespace           = "AWS/ECS"
#   period              = "60"
#   statistic           = "Average"
#   threshold           = "85"

#   dimensions = {
#     ClusterName = aws_ecs_cluster.ecs-portal.name
#     ServiceName = aws_ecs_service.nginx.name
#   }

#   alarm_actions = [aws_appautoscaling_policy.scale-out-policy.arn]
# }

# # Cloudwatch alarm that triggers the autoscaling down policy
# resource "aws_cloudwatch_metric_alarm" "service_cpu_low" {
#   alarm_name          = "cb_cpu_utilization_low"
#   comparison_operator = "LessThanOrEqualToThreshold"
#   evaluation_periods  = "2"
#   metric_name         = "CPUUtilization"
#   namespace           = "AWS/ECS"
#   period              = "60"
#   statistic           = "Average"
#   threshold           = "10"

#   dimensions = {
#     ClusterName = aws_ecs_cluster.ecs-portal.name
#     ServiceName = aws_ecs_service.nginx.name
#   }

#   alarm_actions = [aws_appautoscaling_policy.scale-in-policy.arn]
# }
