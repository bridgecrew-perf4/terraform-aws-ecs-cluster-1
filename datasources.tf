data "aws_subnet_ids" "self" {
  vpc_id = var.vpc_id
}
