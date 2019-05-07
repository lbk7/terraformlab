terraform {
  backend "s3" {
    bucket = "myonboardings3"
    key    = "vpc\terraform.tfstate"
    region = "eu-west-1"
  }
}
