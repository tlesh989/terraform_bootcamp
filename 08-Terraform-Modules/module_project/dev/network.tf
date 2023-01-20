module "vpc" {
  source = "../modules/vpc"

  env        = "dev"
  region     = "us-west-1"
  cidr_block = "10.1.0.0/16"
}
