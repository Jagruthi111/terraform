provider "aws" {
  region = "ap-south-1"
}
terraform {
  backend "s3" {
    region  = "ap-south-1"
    bucket  = "backend-bucket567"
    key     = "state.tfstate"
    dynamodb_table = "backend-statelocking"
  }
}
