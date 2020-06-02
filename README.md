A subdirectory to build a Jenkins instance

Since it uses count = "2" it should build a new instance, and perserve the existing.  This gives you a chance to make sure the new one is running well, after you run the ansible to set it up.

Running the terraform:

run terraform init && terraform plan && terraform apply

This will export some info about the system created:

Outputs:

availability_zone = [
  "us-east-1a",
]
id = [
  "i-0a1ceae05f11e96f5",
]
instance_ip_addr = 10.247.33.22
private_ip = [
  "10.247.33.22",
]
security_groups = [
  [
    "sg-1138426c",
    "sg-15384268",
    "sg-ecc06d90",
  ],
]
subnet_id = [
  "subnet-cecd4c95",
]
tags = [
  {
    "Name" = "qpp-MA-jenkins-sb-2"
    "cpm backup" = "4HR Daily Weekly Monthly Annually"
    "machine" = "jenkins"
    "ref" = "jenkins-sb-s3-role"
  },
]


Jenkins security:

This install may come with an insecure configuration, allows login w/o creds.

Follow the documentation here: https://wiki.jenkins.io/display/JENKINS/Standard+Security+Setup to secure the instance

