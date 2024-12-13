provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "git@github.com:vikasjoshi169/aws_terraform_module.git//vpc?ref=v1.1"
  env             = "dev"
  azs             = ["ap-south-1a", "ap-south-1b"]
  private_subnets = ["10.0.0.0/19", "10.0.32.0/19"]
  public_subnets  = ["10.0.64.0/19", "10.0.96.0/19"]

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
    "kubernetes.io/cluster/dev-demo"  = "owned"
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb"         = 1
    "kubernetes.io/cluster/dev-demo" = "owned"
  }
}


module "ec2" {
  source          = "git@github.com:vikasjoshi169/aws_terraform_module.git//ec2?ref=v1.1"
  instance_type   = "t2.micro"
  aws_region      = "ap-south-1"
}