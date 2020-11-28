provider "aws" {
  region = "us-east-1"
}

//data "aws_ami" "jenkins_ubuntu" {
//  most_recent = true
//
//  filter {
//    name   = "jenkins_ubuntu"
//    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
//  }
//
//  filter {
//    name   = "virtualization-type"
//    values = ["hvm"]
//  }
//
//  owners = ["679593333241"] # Canonical
//}

resource "aws_instance" "jenkins_ubuntu" {
  ami           = "ami-0b57f597a4718bea6"
  instance_type = "t2.micro"

  tags = {
    Name = "Jenkins"
  }
}
