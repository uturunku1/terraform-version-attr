terraform {
   cloud {
    # organization = "example-org-615f54"
    organization = "hashicorp"
    hostname = "tfcdev-326ff8f0.ngrok.io"
    workspaces {
      name = "terraform-version-attr"
      # tags = ["tag1", "tag3"]
    }
  }
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
  # required_version = ">= 1.1.2, < 1.1.8"
}

variable "username" {
  default = "uturunku
}

resource "null_resource" "random" {
  triggers = {
    username = var.username
  }
}

output "random" {
  value = "Changed to ${null_resource.random.id}"
}

output "username" {
  value = "Username is ${var.username}. Extra text???"
}


output "val" {
  value = terraform.workspace
}

resource "random_pet" "always_new" {
  keepers = {
    uuid = uuid() # Force a new name each time
  }
  length = 3
}

output "pet" {
  value = { name_of_pet : random_pet.always_new.id }
}


