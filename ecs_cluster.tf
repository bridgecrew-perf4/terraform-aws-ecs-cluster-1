#### Begins Cluster ECS
resource "aws_ecs_cluster" "self" {
  name = "${var.name}-cluster"
}

resource "aws_ecs_service" "self" {
  name             = "${var.name}-service"
  cluster          = aws_ecs_cluster.self.id
  task_definition  = aws_ecs_task_definition.self.arn
  launch_type      = var.launch_type
  platform_version = var.launch_type == "FARGATE" ? var.plateform_version : null

  desired_count = var.desired_count

  network_configuration {
    subnets = data.aws_subnet_ids.self.ids

    security_groups = [
      aws_security_group.service.id
    ]

    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.self.arn
    container_name   = var.container_name
    container_port   = var.container_port
  }
}

resource "aws_ecs_task_definition" "self" {
  family                   = "task"
  container_definitions    = var.container_definition
  task_role_arn            = aws_iam_role.ecs-task-exec-role.arn
  execution_role_arn       = aws_iam_role.ecs-task-exec-role.arn
  network_mode             = "awsvpc"
  cpu                      = "1024"
  memory                   = "4096"
  requires_compatibilities = ["FARGATE"]
}
