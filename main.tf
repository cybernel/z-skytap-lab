terraform {
  required_providers {
    skytap = {
      source = "skytap/skytap"
      version = "0.15.1"
    }
  }
}

variable "skytapusername" {type = string}
variable "skytaptoken" {type = string}

provider "skytap" {
  # Configuration options
    username = var.skytapusername
    api_token = var.skytaptoken
}

# We need to start with an environment by using an empty template and assign it a name
# https://cloud.skytap.com/templates/2205127 Empty Environment Tenplate
resource "skytap_environment" "Environment01" {
  template_id = "2205127"
  # this is the name for the environment that shows up in skytap
  name = "APJ TAG ZPA AD+RDS Lab"
  # The description that shows up in skytap
  description = "APJ TAG ZPA AD+RDS Lab built using terraform"
  tags = ["zpa","windows server","2022"]
  shutdown_on_idle = "3600"
  }

# Generate VM URL's
  output "http_Environment01" {
  value = "https://cloud.skytap.com/configurations/${skytap_environment.Environment01.id}"
}
