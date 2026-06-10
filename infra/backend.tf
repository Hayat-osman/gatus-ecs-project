terraform {
  backend "s3" {
    bucket       = "hayats-labs-terraform-state"
    key          = "gatus/dev/terraform.tfstate"
    region       = "eu-west-2"
    encrypt      = true
    use_lockfile = true
  }
}