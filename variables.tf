variable "backend_port" {
  description = "The port for backend HTTP requests."
  default     = 3000
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-west-2"
}

variable "key_name" {
  description = "AWS access keys"
  default     = "tf-backend"
}

variable "aws_amis" {
  default = {
    us-west-2 = "ami-01e24be29428c15b2"
  }
}