terraform {
  backend "s3" {
    bucket         = "env:BUCKET"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
