variable "project" {
  description = "The name of the project"
  type        = string

}

variable "environment" {
  description = "The environment (e.g., dev, staging, prod)"
  type        = string

}

variable "vpc_id" {
  description = "The ID of the VPC where the EKS cluster will be deployed"
  type        = string

}

variable "subnet_ids" {
  description = "A list of subnet IDs where the EKS cluster will be deployed"
  type        = list(string)

}

variable "kubernetes_version" {
  description = "The version of the EKS cluster"
  type        = string
  default     = "1.33"

}

variable "instance_type" {
  description = "The EC2 instance type for the EKS worker nodes"
  type        = list(string)

}

variable "desired_size" {
  description = "The desired number of worker nodes"
  type        = number

}

variable "max_size" {
  description = "The maximum number of worker nodes"
  type        = number

}

variable "min_size" {
  description = "The minimum number of worker nodes"
  type        = number

}
