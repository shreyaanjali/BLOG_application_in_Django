terraform {
    backend "s3" {
        bucket = "my-terraform-state-bucket"
        key = "erraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "my-terraform-lock-table"
        encrypt = true
    }  
}