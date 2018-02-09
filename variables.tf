variable "public_key_path" {
  description = "public key path"
  default = "/root/terraformkey.pub"
}

variable "key_name" {
  description = "Desired name of AWS key pair"
  default = "developerkeypair1"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "eu-central-1"
}

# Ubuntu Precise 12.04 LTS (x64)
variable "aws_amis" {
  default = {
    eu-central-1 = "ami-5652ce39"
  }
}
