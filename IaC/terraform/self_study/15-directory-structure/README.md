**테라폼코드를 구성하는 차원에서 어떤식으로 코드를 구성할 수 있는지 확인해보자.**

코드 중에서 핵심적으로 보면 하는 것들은  
**config.yaml  
outputs.tf  
remote-states.tf  
terraform.auto.tfvars  
terraform.tf  
variables.tf  
versions.tf**  
이다. ( 항상 다른 워크스페이스에서 동일하게 존재하는 테라폼코드 )

나머지는 리소스 종류별로 파일을 나눈것이다.
해당 리소스 종류의 코드를 찾을때 리소스에 해당하는 테라폼코드를 열어 속성을 확인하면 된다.

YAML에는 path를 file이라는 함수를 통해 read를 수행하는데 yamldecode를 수행하면
YAML → HCL Object로 변형해준다.  
( YAML 에서 Object구조로 되어있으면 HCL Object로 되고 YAML의 List로 되어있으면 HCL List로 변형된다.  
YAML 파일내의 변수들에 쉽게 접근할 수 있다. )

templatefile 함수는 file을 로딩할때 context variable 전달하여 템플릿을 렌더링한다.
