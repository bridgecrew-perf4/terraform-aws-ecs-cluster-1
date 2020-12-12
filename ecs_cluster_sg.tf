resource "aws_security_group" "service" {
  name        = "service-${var.name}"
  description = "Allow traffic to web servers"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = "8080"
    to_port         = "8080"
    security_groups = [aws_security_group.lb.id]
    protocol        = "tcp"
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
