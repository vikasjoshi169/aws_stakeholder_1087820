provider "aws" {
  region = "ap-south-1"
}


module "ec2" {
  source          = "git@github.com:vikasjoshi169/aws_terraform_module.git//ec2?ref=v1.1"
  instance_type   = "t2.micro"
  aws_region      = "ap-south-1"
}