variable "subnets" {
  type = list(object({
    name              = string
    cidr_block        = string
    is_public         = bool
    availability_zone = string
  }))
}

variable "vpc_id" {
  type = string
}

variable "env" {
  type        = string
  description = "The AWS environment"

}

variable "region" {
  type        = string
  description = "The AWS region"
}

variable "public_route_table_id" {
  type = string
}

variable "private_route_table_id" {
  type = string
}
