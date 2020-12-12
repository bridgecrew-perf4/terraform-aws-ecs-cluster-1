#TODO! Need complete refactor

#### This file describe the different role required for the ecs cluster exection ####

### Execution Task role ###

## Create the trust entities policy to allow assume role required by ecs cluster to run tasks ##
data "aws_iam_policy_document" "trust-entities-ecs-tasks" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

## Create the role for the task execution and add the trust entities policy##
resource "aws_iam_role" "ecs-task-exec-role" {
  name               = "role-ecs-tasks-exec-${var.name}"
  assume_role_policy = data.aws_iam_policy_document.trust-entities-ecs-tasks.json
}

## Attach the policy to the role ##
## The policy used is an AWS managed policy ##

resource "aws_iam_role_policy_attachment" "task-exec-role-attachment" {
  role       = aws_iam_role.ecs-task-exec-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

### Auto Scale role ###

## Create the trust entities policy to allow assume role required by ecs cluster to perform auto scaling tasks ##

data "aws_iam_policy_document" "trust-entities-ecs-autoscale" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["application-autoscaling.amazonaws.com"]
    }
  }
}

## Create the role for the auto scaling service and add the trust entities policy##

resource "aws_iam_role" "ecs-autoscale-role" {
  name               = "role-ecs-autoscale-${var.name}"
  assume_role_policy = data.aws_iam_policy_document.trust-entities-ecs-autoscale.json
}

## Attach the policy to the role ##
## The policy used is an AWS managed policy ##

resource "aws_iam_role_policy_attachment" "autoscale-role-attachment" {
  role       = aws_iam_role.ecs-autoscale-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceAutoscaleRole"
}
