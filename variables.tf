variable "app_abbreviation" {
  description = "Application abbreviation (2-12 alphabetic characters)"
  type        = string
  validation {
    condition     = can(regex("^[a-zA-Z]{2,12}$", var.app_abbreviation))
    error_message = "App abbreviation must be 2-12 alphabetic characters only"
  }
}

variable "tags" {
  description = "A map of tags to assign to the account"
  type        = map(string)
  default     = {}
}

variable "enabled_regions" {
    description = "List of AWS regions to enable. Default is us-east-1, us-west-2, us-east-2, ap-south-1, ap-southeast-1."
    type        = list(string)
}


variable "organizational_unit" {
  description = "The organizational unit for which to generate the file"
  type        = string
  validation {
    condition = contains([
      "operate",
      "root",
      "sandbox"
    ], var.organizational_unit)
    error_message = "Organizational unit must be one of: operate, operate-dev, operate-lab, operate-prod, infrastructure, innovate, security"
  }
}

variable "account_email" {
  type = string
}

locals {
  # # Create list of selected regions based on enabled variables
  # selected_regions = compact([
  #   var.enable_us_east_1 ? "us-east-1" : "",
  #   var.enable_us_east_2 ? "us-east-2" : "",
  #   var.enable_us_west_2 ? "us-west-2" : "",
  #   var.enable_ap_south_1 ? "ap-south-1" : "",
  #   var.enable_ap_southeast_1 ? "ap-southeast-1" : ""
  # ])

  project_name = {
    "operate" = "wlz-aws-operate",
    "sandbox" = "wlz-aws-sandbox"
    "root"    = "avm-root"
  }
  account_name = "avm-${var.organizational_unit}-${var.app_abbreviation}"
}