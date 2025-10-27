terraform {
  backend "s3" {
    dynamodb_table = "terraform-lock"
    region         = "eu-central-1"
  }
}
