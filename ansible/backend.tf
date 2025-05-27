terraform {
  backend "s3" {
    bucket         = "terraform-backend-ayush-bucket"
    key            = "github/ansible/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-backend-ayush-locks"
    encrypt        = true
  }
}
