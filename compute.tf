provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "jenkins" {
  count = "2"
  root_block_device {
    volume_size = "200"
    volume_type = "standard"
  }
  ami = var.ami
  instance_type = var.instance_type
  iam_instance_profile = var.iam_instance_profile
  tags = {
    Name = "qpp-MA-jenkins-sb-4",
      "cpm backup" = "4HR Daily Weekly Monthly Annually",
       machine = "jenkins4",
       ref = "jenkins-sb-s3-role"
  }
#   vpc_security_group_ids = [ "{$var.vpc_security_group_ids}" ]
#    vpc_security_group_ids = ["sg-1138426c", "sg-ecc06d90", "sg-15384268"]
     vpc_security_group_ids = var.vpc_security_group_ids
   subnet_id = "subnet-cecd4c95"
   key_name = var.key_name
# do local exec
#   provisioner "local-exec" {
#     command = "sleep 240; scp -o StrictHostKeyChecking=no -pr -i ~/QPPMA/certs/qpp-ar-dev-20171214.pem ./jobs.tar ec2-user@${aws_instance.jenkins.private_ip}:/tmp; scp -o StrictHostKeyChecking=no -pr -i ~/QPPMA/certs/qpp-ar-dev-20171214.pem ./creds.tar ec2-user@${aws_instance.jenkins.private_ip}:/tmp;scp -o StrictHostKeyChecking=no -pr -i ~/QPPMA/certs/qpp-ar-dev-20171214.pem ./install-plugins.sh ec2-user@${aws_instance.jenkins.private_ip}:/home/ec2-user;scp -o StrictHostKeyChecking=no -pr -i ~/QPPMA/certs/qpp-ar-dev-20171214.pem ./jenkins-cli.jar ec2-user@${aws_instance.jenkins.private_ip}:/home/ec2-user"
#  }
}

# resource "null_resource" "remote-exec" {
# provisioner "remote-exec" {
#       connection {
#       agent       = false
#       timeout     = "30m"
#       host = "${aws_instance.jenkins.private_ip}"
#       user        = "ec2-user"
#       private_key = "${file("/Users/marc.richardson/QPPMA/certs/qpp-ar-dev-20171214.pem")}"
#     }

#     inline = [
# #      "sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo",
# #      "sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key",
# #      "sudo yum install -y java-1.8.0-openjdk-devel",
# #      "sudo yum install -y docker",
# #      "sudo yum install -y git",
#       # allow docker to run as non-root
# #      "sudo groupadd docker",
# #      "sudo usermod -aG docker ec2-user",
#       "sudo chkconfig --level 2345 docker on",
# #      "sudo yum install -y jenkins",
#       "sudo service jenkins start",
#       "sudo yum clean all",
#       #install jobs and users
#       "sudo tar xf /tmp/jobs.tar -C /var/lib/jenkins",
#       "sudo cp -pr /tmp/jobs /var/lib/jenkins/jobs",
#       "sudo chown -R jenkins:jenkins /var/lib/jenkins/jobs",
#       "sudo tar xf /tmp/creds.tar -C /tmp",
#       "sudo mv /tmp/secrets /var/lib/jenkins/secrets && chown jenkins:jenkins /var/lib/jenkins/secrets/",
#       "sudo mv /tmp/users /var/lib/jenkins/users && chown jenkins:jenkins /var/lib/jenkins/users",
#       "sudo chown jenkins:jenkins /var/lib/jenkins/secrets/",
#       "sudo chown jenkins:jenkins /var/lib/jenkins/users",
#       "sudo chmod 700 /var/lib/jenkins/secrets",
#       # install plugins, and restart to activate
#       "/home/ec2-user/install-plugins.sh",
#       "sudo service jenkins restart",
#       # reboot to reset docker group
#       "sudo reboot"
#     ]
# }
# }

  
