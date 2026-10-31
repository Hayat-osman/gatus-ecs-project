terraform {
  backend "s3" {
    bucket       = "hayat-labs-tf-state"
    key          = "gatus/dev/terraform.tfstate"
    region       = "eu-west-2"
    encrypt      = true
    use_lockfile = true
  }
}