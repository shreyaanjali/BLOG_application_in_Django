provider "aws" {
  region     = "us-east-1"
}


backend "s3" {
     region = "us-east-1"
     key = "terraform.tfstate"
}
