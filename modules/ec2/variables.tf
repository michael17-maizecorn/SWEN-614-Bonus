variable "subnet_id" { type = string }
variable "ec2_sg_id" { type = string }
variable "key_name"  { type = string }

variable "rds_endpoint" { type = string }
variable "db_name"      { type = string }
variable "db_username" {
  type      = string
  sensitive = true
}
variable "db_password" {
  type      = string
  sensitive = true
}