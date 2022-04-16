**variable** 을 불러오는데 아래와 같은 순서로 불러온다.

- 환경변수 ( export TF_VAR_image_id=”test” ) 와 같이 TF_VAR 로 시작하는 변수
- terraform.tfvars 파일 if present
- terraform.tfvars.json 파일 if present
- _.auto.tfvars or _.auto.tfvars.json 파일을 불러들인다.
- terraform apply -var=”vpc_name=fastcampus” 이렇게 지정할 수 있다.
  terraform apply -tf-vars=파일명.tfvars 로 지정할 수 있다.

**Arguments**

- `default` - 변수에 값을 지정하지 않았을때 사용하는 값
- `type` - 테라폼이 해당 변수가 어떤 타입을 가져야하는지 자동으로 추론을 하기 때문에 명시적으로 적지않아도 되지만 다른사람이 테라폼 코드를 수행할때 type값을 이미 알고 있다면 수월하기에 type을 지정해준다.
- `description` - 팀원과 테라폼 코드를 관리할 때 다른사람이 이해하기 쉽도록 variable이 어떤 역할을 하는지 적어놓는다. ( 한글, 영어 둘다 가능)
- `[validation](https://www.terraform.io/language/values/variables#custom-validation-rules)` - 일반적으로 유형 제약 조건에 추가하여 유효성 검사 규칙을 정의하는 블록입니다.
- `[sensitive](https://www.terraform.io/language/values/variables#suppressing-values-in-cli-output)` - 변수가 구성에서 사용될 때 Terraform UI 출력을 제한합니다.
- `[nullable](https://www.terraform.io/language/values/variables#disallowing-null-input-values)` - 변수 블록 의 인수는 모듈 호출자가 `null`변수에 값을 할당할 수 있는지 여부를 제어합니다.
