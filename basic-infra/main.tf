resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = " web instance"
  }
}
resource "aws_security_group" "traffic" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic  and all outbound traffic"
  vpc_id      = var.vpc_id
  ingress {
    description = "Allow TLS inbound traffic"
    protocol  = "tcp"
    from_port = var.port_ingress
    to_port   = var.port_ingress
  }

  egress {  
    description = "Allow TLS outbound traffic"
    from_port = var.port_egress
    to_port   = var.port_egress
    protocol  = "tcp"
    cidr_blocks = [var.cidr_block]
  }
  
  tags = {
    Name = "allow_tls"
  }
}
