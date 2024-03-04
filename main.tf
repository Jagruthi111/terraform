module "basic-infra" {
  source = "./basic-infra"
  ami_id = "ami-03f4878755434977f"
  instance_type = "t2.micro"
  vpc_id = "vpc-0ca4e153f9adae76e"
  port_ingress = "22"
  port_egress = "0"
  cidr_block = "0.0.0.0/0"
}
