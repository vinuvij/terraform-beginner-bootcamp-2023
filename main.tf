terraform {
  cloud {
    organization = "cloud_boot_camp"

    workspaces {
      name = "Terra-house"
    }
  }

  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.21.0"
    }	
  }
}

resource "random_string" "bucket_name" {
  lower            = true
  upper            = false
  length           = 32
  special          = false
}

resource "aws_s3_bucket" "example1" {
  # Bucket Naming Rules
  # 
  bucket = random_string.bucket_name.result
}

output "random_bucket_name" {
  value = random_string.bucket_name.result
}
