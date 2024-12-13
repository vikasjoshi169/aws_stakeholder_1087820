terraform {
  backend "s3" {
    bucket = "aws-stakeholder-1087820-bucket"
    key    = "preprod-terraform.tfstate"
    region = "ap-south-1"
  }
}