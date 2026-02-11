variable "aws_region" {
    type    = string
    default = "us-east-1"
}

variable "vpc_cidr" {
    type    = string
    default = "10.0.0.0/16"
}

variable "vpc_name" {
    type    = string
    default = "WordPress VPC"
}

variable "public_subnet_cidr" {
    type    = string
    default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
    type    = string
    default = "10.0.2.0/24"
}

variable "public_az" {
    type    = string
    default = "us-east-1a"
}

variable "private_az" {
    type    = string
    default = "us-east-1b"
}

variable "key_name" {
    type      = string
    sensitive = true
}

variable "db_name" {
    type    = string
    default = "wordpressdb"
}

variable "db_username" {
    type      = string
    sensitive = true
}

variable "db_password" {
    type      = string
    sensitive = true
}