variable "name" {
}

variable "vpc_id" {
}
variable "subnets_ids" {
}
variable "tags" {
}
variable "region" {
  description = "aws region"
  default     = "eu-central-1"
}


variable "eks-name" {
  type    = string
  default = "my-cluster"
}

variable "env" {
  default = "dev"
}

