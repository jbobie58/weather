# Input Variables
# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-2"
}
# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = "dev"
}
# Business Division
variable "business_divsion" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type        = string
  default     = "inadev"
}

variable "aws_account_id" {
  type        = string
  default     = "xxxx"
  description = "Account ID"
}

# S3 bucket variables
variable "bucket" {
  type    = string
  default = ""
}

variable "condition" {
  type    = bool
  default = "true"
}

variable "status" {
  type    = string
  default = "Enabled"
}

# Add more user names as needed
variable "user" {
  type = map(string)
  default = {
    user1 = "user1"
  }
}