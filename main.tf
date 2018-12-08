# Specify the provider and access details
provider "aws" {
  region = "${var.aws_region}"
}

# Our default security group to access
# the instances over SSH and HTTP
resource "aws_security_group" "backend" {
  name        = "mhgu_query_instance_tf"
  description = "Server for mhgu-query backend. Managed by Terraform."

  # SSH access from the VPC
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from the VPC
  ingress {
    from_port   = "${var.backend_port}"
    to_port     = "${var.backend_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "backend" {
  instance_type = "t2.micro"

  # Lookup the correct AMI based on the region
  # we specified
  ami = "${lookup(var.aws_amis, var.aws_region)}"

  # SSH Key name
  key_name = "${var.key_name}"

  # Our Security group to allow HTTP and SSH access
  vpc_security_group_ids = ["${aws_security_group.backend.id}"]

  # Bootstrap the server
  # user_data = "${file("scripts/bootstrap-backend.sh")}"

  tags {
    Name = "Webserver for backend mhgu-query. Managed by Terraform."
  }
}