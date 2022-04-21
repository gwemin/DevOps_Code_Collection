## terraform-remote-state 데이터소스 활용

workspace -> state 관리단위

ec2-instance가 network 워크스페이스에 의존적일 수 밖에없다. ec2를 생성하려면 network가 있어야 위에 올릴수 있기 때문이다.

**그래서 network에 의존적인 ec2-instance에서 network에 state를 가져와서 사용해볼 것이다.**

output 으로 내보내야 ec2-instance에서 사용할 수 있다.

규모가 있는 테라폼 코드를 다룰때 terraform-remote-state는 꼭 필요한 기능이다.

익혀두자.

ec2-instance 의 data 에서 config에서 path로 .tfstate를 불러온다.
그럼 data.terraform_remote_state.워크스페이스이름.outputs.outputs속성
처럼 사용할 수 있다. ( 반드시 outputs를 붙여서 사용해야한다. )

의존성이 있는 워크스페이스들을 tf destroy 할때는 의존성 생각해서 지우자!!
