provider "aws" {
    region = "ap-northeast-2"
}

data "aws_ami" "gwemin_ubuntu" {
    most_recent = true

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }

    owners = ["099720109477"] # Canonical
}


resource "aws_instance" "gwemin_ubuntu" {
  ami           = data.aws_ami.gwemin_ubuntu.image_id
  instance_type = "t2.micro"
  
  tags = {
    Name = "GweminServer"
  }
}