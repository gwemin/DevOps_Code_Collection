data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "private" {
  ami           = data.aws_ami.ubuntu.image_id
  instance_type = "t2.micro"
  subnet_id     = local.subnet_groups["private"].ids[0]
  key_name      = "gwemin"

  vpc_security_group_ids = [
    module.sg__ssh.id,
  ]

  tags = {
    Name = "${local.vpc.name}-private"
  }
}
# templatefile 첫번째 인자 파일경로, 2번째 인자는 context값
# context값을 읽어 파일에 넣어서 렌더링한다고 보면된다.
locals {
  openvpn_userdata = templatefile("${path.module}/files/openvpn-userdata.sh", {
    vpc_cidr  = local.vpc.cidr_block
    public_ip = aws_eip.openvpn.public_ip
  })
  common_tags = {
    "Project" = "openvpn"
  }
}

resource "aws_instance" "openvpn" {
  ami           = data.aws_ami.ubuntu.image_id
  instance_type = "t2.micro"
  subnet_id     = local.subnet_groups["public"].ids[0]
  key_name      = "gwemin"

  user_data = local.openvpn_userdata

  associate_public_ip_address = false
  vpc_security_group_ids = [
    module.sg__ssh.id,
    module.sg__openvpn.id,
  ]

  tags = {
    Name = "${local.vpc.name}-openvpn"
  }
}
