terraform {
  required_version = ">= 1.0"

  required_providers {
    adguard = {
      source  = "gmichels/adguard"
      version = "1.3.0"
    }
  }

  backend "s3" {
    endpoint                    = "https://s3.cloud.ru"
    key                         = "adguard/terraform.tfstate"
    region                      = "ru-central-1"
    bucket                      = "terraform-state"
    use_path_style              = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}
