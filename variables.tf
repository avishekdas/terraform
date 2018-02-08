variable "public_key_path" {
  description = "public key path"
  default = "C:/Workspace/Terraform/avishekgit/terraform/id_rsa.ppk"
}

variable "key_name" {
  description = "Desired name of AWS key pair"
  default = "key_pair"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-west-2"
}

# Ubuntu Precise 12.04 LTS (x64)
variable "aws_amis" {
  default = {
    eu-west-1 = "ami-674cbc1e"
    us-east-1 = "ami-1d4e7a66"
    us-west-1 = "ami-969ab1f6"
    us-west-2 = "ami-8803e0f0"
  }
}
