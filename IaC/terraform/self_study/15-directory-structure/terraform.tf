terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "gwemin-devops-terraform"
  }
  workspace {
    name = "aws-network-apne2-fastcampus"
  }
}


# Local Variables

locals {
  aws_accounts = {
    fastcampus = {
      id     = "xxxxxx"
      region = "ap-northeast-2"
      alias  = "posquit0-fastcampus"
    }
  }
  # ✨Tip✨
  # config_file YAML Path를 file로 read 하게 되는데 yamldecode를 통하면 HCL  
  # Object로 변환시켜준다. 
  context = yamldecode(file(var.config_file)).context

  # context variable 전달해서 템플릿을 렌더링할 수 있다.
  # config.yaml 17~18에서 "${vpc}" 처럼 사용가능
  config  = yamldecode(templatefile(var.config_file, local.context))
}


# Provider
provider "aws" {
  region = local.aws_accounts.fastcampus.region

  allowed_account_ids = [local.aws_accounts.fastcampus.id]
  assume_role {
    role_arn     = "arn:aws:iam::${local.aws_accounts.fastcampus.id}:rold/terraform-access"
    session_name = local.context.workspace
  }
}

