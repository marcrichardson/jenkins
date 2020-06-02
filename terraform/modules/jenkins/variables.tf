variable "ami" {
  default = "ami-02686ec50bd0643ae"
}

variable "vpc_id" {
  default = "vpc-32955854"
}

variable "instance_type" {
  default = "m3.2xlarge"
}

variable "iam_instance_profile" {
  default = "qppsf-ecr-role"
}

variable "vpc_security_group_ids" {
  type = list
  default = ["sg-1138426c", "sg-ecc06d90", "sg-15384268"]
}

variable "subnet_id" {
  default = "subnet-cecd4c95"
}

variable "lb_subnet_ids" {
  default = ["subnet-03b7081092a35d0e8", "subnet-cecd4c95"]
}

variable "key_name" {
  default = "qpp-ar-dev-20171214"
}

variable "alb_name" {
  default = "scoring-jenkins-alb"
}

variable "s3_bucket" {
  default = "qpp-terraform/scoring/alb-logs"
}

variable "alb_listener_port" {
  default = "8080"
}

variable "alb_listener_protocol" {
  default = "HTTP"
}

variable "idle_timeout" {
  default = "60"
}

variable "internal_alb" {
  default = "true"
}

variable "target_group_name" {
  default = "jenkins-target-group"
}