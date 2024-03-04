variable "ami_id" {
  description = "AMI ID of the EC2 instance"
  type = string
 }
variable "instance_type" {
  description = "The instance size"
  type = string
 }
variable "vpc_id" {
  description = "The default VPC region of the region"
  type = string
 }
 variable "port_ingress" {
  description = "ingress port number"
  type = number
 }
 variable "port_egress" {
  description = "egress port number"
  type = number
 }
  variable "cidr_block" {
  description = "egress CIDR block"
  type = string 
 }
