variable "cidr_block" {
  type        = string
  description = "The cidr block assigned to the VPC"
}

variable "enable_igw" {
  type        = bool
  description = "Toggle creation of the IGW"
  default     = true
}

variable "env" {
  type        = string
  description = "The AWS environment"

}

variable "region" {
  type        = string
  description = "The AWS region"
}
