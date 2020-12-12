resource "aws_alb" "self" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = var.lb_type
  security_groups    = [aws_security_group.lb.id]
  subnets            = data.aws_subnet_ids.self.ids

  enable_deletion_protection = false
}

resource "aws_alb_listener" "self" {
  load_balancer_arn = aws_alb.self.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.self.arn
  }
}

resource "aws_alb_target_group" "self" {
  name        = var.name
  port        = 8080
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id
}

resource "aws_alb_target_group_attachment" "self" {
  target_group_arn = aws_alb_target_group.self.arn
  target_id        = aws_ecs_service.self.id
}

resource "aws_security_group" "lb" {
  name        = "load-balancer-${var.name}"
  description = "Allow traffic to web servers"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = "80"
    to_port     = "80"
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
