variable "policy_name" {
  description = "Name of the IAM policy"
  type        = string
  default     = "EC2-ReadOnly-Policy"
}

variable "policy_json" {
  description = "IAM policy JSON document"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

