provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "jenkins" {
  count = "3"
  root_block_device {
    volume_size = "200"
    volume_type = "standard"
  }
#  block_device_mappings {
#    device_name = "/dev/sda1"

#    ebs {
#      volume_size = 200
#    }
#  }

  ami = var.ami
  instance_type = var.instance_type
  iam_instance_profile = var.iam_instance_profile
  tags = {
    Name = "qpp-MA-jenkins-sb-${count.index+1} "
    "cpm backup" = "4HR Daily Weekly Monthly Annually"
    ami_image = "EAST-RH 7-7 Gold Image V.1.07 (HVM) 03-25-2020"
    component_type = "jenkins"
    os = "rhel"
    os_version = "RHEL7"
   }
     vpc_security_group_ids = var.vpc_security_group_ids
   subnet_id = var.subnet_id
   key_name = var.key_name
}
