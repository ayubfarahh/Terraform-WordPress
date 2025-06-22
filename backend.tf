terraform {
    backend "s3"{
    bucket = "terra-bucket29"
    key = "terraform.tfstate"
    region = "eu-west-2"
  }
}
