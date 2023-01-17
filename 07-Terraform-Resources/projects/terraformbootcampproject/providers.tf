terraform {
  cloud {
    organization = "tlesh-net"

    workspaces {
      name = "terraform_bootcamp"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.5"
    }
  }

  required_version = "~> 1.2.4"
}

provider "aws" {
  region  = "us-west-2"
  profile = "terraform_bootcamp"

}
