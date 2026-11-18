module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.project}-${var.environment}-vpc"
  cidr = var.vpc_id

  azs              = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets  = var.private_subnet_ids
  public_subnets   = var.public_subnet_ids
  database_subnets = var.db_subnet_ids

  enable_nat_gateway           = true
  enable_dns_hostnames         = true
  single_nat_gateway           = true
  enable_dns_support           = true
  create_database_subnet_group = true

  tags = {
    project     = var.project
    environment = var.environment
  }
}


resource "aws_vpc_endpoint" "s3" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = module.vpc.private_route_table_ids
  tags = {
    Name    = "${var.project}-${var.environment}-s3"
    Project = var.project
    Env     = var.environment
  }
}
