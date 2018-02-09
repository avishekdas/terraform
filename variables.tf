variable "public_key_path" {
  description = "public key path"
  default = "/home/ec2-user/terraform/developerkeypair.pub"
}

variable "key_name" {
  description = "Desired name of AWS key pair"
  default = "developerkeypair"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "eu-central-1b"
}

# Ubuntu Precise 12.04 LTS (x64)
variable "aws_amis" {
  default = {
    eu-central-1b = "ami-5652ce39"
  }
}
