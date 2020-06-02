terraform {
  backend "s3" {
    bucket = "qpp-terraform"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}