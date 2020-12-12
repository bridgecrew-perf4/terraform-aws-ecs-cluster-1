variable "name" {
  type        = string
  description = "Cluster Name"
}

variable "launch_type" {
  type        = string
  description = "The launch type on which to run your service. The valid values are \"EC2\" and \"FARGATE\""
  default     = "FARGATE"
}

variable "plateform_version" {
  type        = string
  description = "The platform version on which to run your service. Only applicable for \"launch_type\" set to \"FARGATE\""
  default     = "LATEST"
}

variable "desired_count" {
  type        = string
  description = "(optional) describe your variable"
  default     = 1
}

variable "cluster_role" {
  type        = string
  description = "(optional) describe your variable"
  default     = null
}

variable "container_name" {
  type        = string
  description = "(optional) describe your variable"
}

variable "container_port" {
  type        = string
  description = "(optional) describe your variable"
}

variable "container_definition" {
  type        = any
  description = "Container Definition"
}

variable "vpc_id" {
  type        = string
  description = "VPC Id to deploy the cluster"
}

variable "lb_type" {
  type        = string
  description = "Frontend lb type"
}
