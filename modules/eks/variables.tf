variable "project" {
  description = "The name of the project"
  type        = string

}

variable "env" {
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
  default     = "1.34"

}

variable "node_group_kubernetes_version" {
  description = "The version of the EKS cluster"
  type        = string

}


variable "vpc_cni_version" {
  description = "The version of the Amazon VPC CNI plugin for Kubernetes"
  type        = string

}

variable "kube_proxy_version" {
  description = "The version of the kube-proxy component"
  type        = string

}

variable "codedns_version" {
  description = "The version of the CoreDNS component"
  type        = string

}

variable "pod_identity_agent_version" {
  description = "The version of the AWS IAM Authenticator for Kubernetes"
  type        = string

}

variable "ami_type" {
  description = "The AMI type for the EKS worker nodes"
  type        = string
  default     = "t3.small"

}

variable "ami_release_version" {
  description = "The AMI release version for the EKS worker nodes"
  type        = string
  default     = "1.34.0-20230915"

}

variable "use_latest_ami_release_version" {
  description = "Whether to use the latest AMI release version for the EKS worker nodes"
  type        = bool

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
