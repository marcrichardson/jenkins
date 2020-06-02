variable "ami" {
  default = "ami-02686ec50bd0643ae"
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

variable "key_name" {
  default = "qpp-ar-dev-20171214"
}

