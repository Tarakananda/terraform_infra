variable "project" {
  description = "The ID of the project in which to create the VPC."
  type        = string
}

variable "environment" {
  description = "The environment for which the VPC is being created (e.g., dev, staging, prod)."
  type        = string

}

variable "region" {
  description = "The AWS region in which to create the VPC."
  type        = string
  default     = "ap-south-1"
}

variable "vpc_id" {
  description = "The ID of the VPC to be created."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_ids" {
  description = "A list of public subnet IDs to be created within the VPC."
  type        = list(string)

}

variable "private_subnet_ids" {
  description = "A list of private subnet IDs to be created within the VPC."
  type        = list(string)

}

variable "db_subnet_ids" {
  description = "A list of database subnet IDs to be created within the VPC."
  type        = list(string)

}
