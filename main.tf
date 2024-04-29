terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.2"
    }
  }

  # backend "s3" {
  #   bucket = "terraform-backup-ap-south-1"
  #   key    = "terraform.tfstate"
  #   region = "ap-south-1"
  # }

  required_version = ">= 1.4"
}

provider "aws" {
  region = "ap-south-1"

  default_tags {
    tags = {
      Creator     = "FallPrediction"
      Environment = "Prod"
      Service     = "Musical wiki"
    }
  }
}
