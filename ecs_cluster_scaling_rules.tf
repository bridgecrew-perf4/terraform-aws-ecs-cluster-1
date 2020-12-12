#TODO! Need complete refactor

#### Begins Autoscaling tasks cluster ####

# ## Set the AutoScalling parameters ##
# resource "aws_appautoscaling_target" "autoscale-nginx" {
#   max_capacity       = "4"
#   min_capacity       = "2"
#   resource_id        = "service/${aws_ecs_cluster.ecs-portal.name}/${aws_ecs_service.nginx.name}"
#   role_arn           = aws_iam_role.ecs-autoscale-role.arn
#   service_namespace  = "ecs"
#   scalable_dimension = "ecs:service:DesiredCount"
# }

# ## Set the Scale out policy ##
# ## We add a task to the ecs cluster whenever more tasks are needed (triggered by a cloudwatch alarm) ##

# resource "aws_appautoscaling_policy" "scale-out-policy" {
#   name               = "scale-out"
#   policy_type        = "StepScaling"
#   resource_id        = aws_appautoscaling_target.autoscale-nginx.resource_id
#   scalable_dimension = aws_appautoscaling_target.autoscale-nginx.scalable_dimension
#   service_namespace  = aws_appautoscaling_target.autoscale-nginx.service_namespace

#   step_scaling_policy_configuration {
#     adjustment_type         = "ChangeInCapacity"
#     cooldown                = 60
#     metric_aggregation_type = "Maximum"

#     step_adjustment {
#       metric_interval_lower_bound = 0
#       scaling_adjustment          = 1
#     }
#   }
# }

# ## Set the Scale in policy ##
# ## We remove a task to the ecs cluster whenever fewer tasks are needed (triggered by a cloudwatch alarm) ##

# resource "aws_appautoscaling_policy" "scale-in-policy" {
#   name               = "scale-in"
#   policy_type        = "StepScaling"
#   resource_id        = aws_appautoscaling_target.autoscale-nginx.resource_id
#   scalable_dimension = aws_appautoscaling_target.autoscale-nginx.scalable_dimension
#   service_namespace  = aws_appautoscaling_target.autoscale-nginx.service_namespace

#   step_scaling_policy_configuration {
#     adjustment_type         = "ChangeInCapacity"
#     cooldown                = 60
#     metric_aggregation_type = "Maximum"

#     step_adjustment {
#       metric_interval_lower_bound = 0
#       scaling_adjustment          = -1
#     }
#   }
# }
