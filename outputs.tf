output "lb_dns" {
  value = aws_alb.self.dns_name
}
