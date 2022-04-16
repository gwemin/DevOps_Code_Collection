provider "aws" {
    region = "ap-northeast-2"
}

variable "vpc_name" {
  
}

module "vpc" {
  source = "tedilabs/network/aws/modules/vpc"
  version = "0.24.0"

  name= "fastcampus"
  cidr_block="10.0.0.0/16"
}