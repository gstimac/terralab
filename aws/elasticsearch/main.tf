terraform {
  backend "s3" {
    bucket         = "BUCKET"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
