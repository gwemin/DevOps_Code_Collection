### terraform 명령어

(terraform을 tf 로 명칭🎈)  
tf state 는 Advanced를 위한 상태 관리  
tf list, tf mv, tf rm 3가지는 알아야 한다.  
`tf state list`: local에 있는게 아니라 backend로 사용하고 있는 워크스페이스가 관리중인 resource 목록을 확인할 수 있다.  
`tf state show 리소스이름`: developer 리소스의 상태를 코드로 확인할 수 있다.  
`tf state mv 변경하려는state 변경후state`: 리팩토링(비즈니스로직을 건드리지 않는 상태에서 코드를 개선) 할때 사용,  
상태저장소에 변경사항 주입,  
변경 전과 변경 후의 마이그레이션을 할 수 있다.

`terraform state rm` 상태저장소에서 해당 resource의 상태를 제거하는 명령어.  
테라폼에서 관리중인 resource 중에 resource를 유지는 하지만 테라폼으로 더이상 관리하지 않는 경우에 사용하면 좋다.  
.tf 파일 내에서 resource를 지우면 aws내에서도 삭제되므로 이 경우에는 terraform state list 으로 resource 확인 후  
`terraform state rm ‘aws_iam_user_policy_attachment.developer[”alice”]’` 와 같이 삭제한다.

<br>

---

pull 은 remote state 저장소에서 상태파일을 로컬로 다운받는것  
`terraform state pull > 파일명.tfstate`

push 는 local state파일을 remote 에다가 덮어씌우는거라고 보면된다
(push는 진짜 조심해야한다. 💣위험!!!💣)

---

<br>

인프라 `resource`에 변경사항은 없는데 뭔가 이것땜에 안되는것 같을때 `resource`를 교체해서 테스트하거나 디버깅해보고 싶을때 가 있다.  
그럴때 `taint` 명령어를 사용한다.

**테라폼은 리소스, 데이터, 개체들의 의존성을 관리하고 있어서 A를 `taint` 하면 A의 의존성을 갖고있는 child에 있는 resource들도 전부 교체된다.**

`terraform taint "resource이름"` : resource를 비정상적인 상태라고 표시한다.

`terraform untaint “”` taint를 걸었던 resource path를 적으면 해당 resource의 taint가 풀린다.

`terraform apply -replace “resource이름”` `taint`를 한 것과 같은 효과를 낼수 있다.  
(한가지 resource에 대해서만 강제유추를 할때는 apply -replace 가 좋을것 같다. )
