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
  default = "sg-0be7e9e40082f94b5"
}
variable "ami_name" {
    default = "ubuntu"
}
variable "ami_id" {
    default = "ami-0994c095691a46fb5"
}
variable "ami_key_pair_name" {
    default = "test-key"
}
variable "region" {
    default = "us-west-2"
}

variable "cidr_block" {
    default = "10.0.0.0/16"
}
variable "zone" {
    default = "us-west-2a"
}
variable "port"{
    default = 22
}
