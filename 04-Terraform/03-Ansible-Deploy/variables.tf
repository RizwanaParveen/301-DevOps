variable "key_name" {
  default = "test-key"
}

variable "pvt_key" {
  default = "/root/.ssh/aws-ec2.pem"
}

variable "us-east-zones" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "sg-id" {
  default = "sg-0aa8e0396515a9fa4"
}
