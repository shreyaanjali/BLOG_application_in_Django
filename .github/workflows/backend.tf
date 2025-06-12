
terraform {
    backend "s3" {
        bucket = "my-terraform-state-bucket"
        key = "."
        region = "us-east-1"
        dynamodb_table = "my-terraform-lock-table"
        encrypt = true
    }
}