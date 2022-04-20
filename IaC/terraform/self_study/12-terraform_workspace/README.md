### terraform workspace

#### 워크스페이스란?

_상위 관리의 단위_

네트워크 관리 코드에서 dev, staging, prod 로 나눌수 있는데 이럴떄 workspace를 이용하여 손쉽게 이용할 수 만들 수 있다.

#### Use Cases

dev / staging / prod
kr / jp / us

<br>

---

<br>

`tf workspace list` 로 현재 워크스페이스를 확인할 수 있고 목록들을 확인할 수 있다.  
`tf workspace show` 워크스페이스의 목록들을 확인할 수 있다.  
`tf workspace new 워크스페이스이름` 워크스페이스를 생성할 수 있다.  
`tf workspace delete 워크스페이스이름` 워크스페이스를 삭제할 수 있다.  
`tf workspace select 워크스페이스이름` 입력한 현재 워크스페이스로 지정한다.  
`tf apply -var-file="워크스페이스.tfvars"` .tfvars 의 변수로 apply 를 실행하는데 각각의 워크스페이스 마다 독립적으로 실행한다.

---

<br>

**`main.tf` 에서는 같은코드로 각각 환경에 맞는 .tfvars 를 주입함으로써 여러환경을 관리할 수 있는 환경이 되었다.**

_✨Tip✨_  
현재 작업중인 워크스페이스를 파악하고 작업을 하자!!!  
테라폼 클라우드 remote backend는 workspace가 다르게 동작한다.  
만약에 terraform cloud remote backend를 사용한다면 [공식문서](https://learn.hashicorp.com/tutorials/terraform/cloud-workspace-create)를 확인해보자
