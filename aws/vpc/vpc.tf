provider "aws" {
  region  = "us-east-1"
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "demo-vpc"
  cidr = "40.0.0.0/16"

  azs             = ["us-east-1a"]
  private_subnets = ["40.0.1.0/24"]
  public_subnets  = ["40.0.101.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
