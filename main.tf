provider "aws" {
    region = var.aws_region
}

module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
    vpc_name = var.vpc_name
}

module "subnets" {
    source = "./modules/subnets"
    vpc_id = module.vpc.vpc_id
    public_subnet_cidr = var.public_subnet_cidr
    public_az = var.public_az
    private_subnet_cidr = var.private_subnet_cidr
    private_az  = var.private_az

}

module "internet" {
  source = "./modules/internet"
  vpc_id = module.vpc.vpc_id
  public_subnet_id = module.subnets.public_subnet_id
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "rds" {
  source = "./modules/rds"
  subnet_ids = [module.subnets.private_subnet_id, module.subnets.public_subnet_id]
  rds_sg_id = module.security_groups.rds_sg_id

  db_name = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}

module "ec2" {
  source = "./modules/ec2"
  subnet_id = module.subnets.public_subnet_id
  ec2_sg_id = module.security_groups.ec2_sg_id
  key_name = var.key_name

  rds_endpoint = module.rds.endpoint
  db_name = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}