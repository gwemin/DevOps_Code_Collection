## Terraform Syntax

```bash
resource "aws_vpc" "main" {
    cidr = var.base_cidr_block
}


<BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>" {
    # Block body
    <IDENTIFIER> = <EXPRESSION> # Argument
}
```

terraform 이 지원하는 블록의 종류는 `terraform`, `provider`, `resource`, `data`, `module`, `local`, `variable`, `output` 이 있다.

BLOCK TYPE에 따라서 BLOCK LABEL 1개가 올지 안올지 2개가올지 결정된다.  
resource 는 2개의 LABEL을 갖게 되는데 처음에는 resource 종류, resource의 이름을 받게 된다.  
key-value 형식으로 하이픈값을 이용하여 해당 변수이름에 변수값을 지정한다고 보면된다.

file은 .tf file extension을 따르고, JSON을 선호한다면 .tf.json 으로 이용할 수 도 있다.

init / paln / apply 할 때 현재 디렉토리에서 .tf, .tf.json 을 찾는데 하위디렉토리는 찾지 않는다.

<br>

---

Text Encoding 은 UTF-8 을 따른다.
운영체제 종류에 따라서 개행문자가 다르다.  
UNIX: **LF** , Window: **CRLF**

<br>

---

.tf or .tf.json 을 가지고 있는 디렉토리를 **Modules** 이라고 부리기도 한다.  
root module, child module 로 구분할 수 있다.

<br>

---

블록의 레이블의 값을 Identifiers 라고 한다.  
레이블에 들어올수 있는 값은 `알파벳`, `_` , `-` 이다.

<br>

---

주석은 # , // 싱글 라인 주석 /\* \*/ 멀티라인 주석도 지원하는 것을 확인 할 수있다.

---

style Conventions  
두개의 스페이바를 따르고  
아래처럼 하이픈을 기준으로 보기 깔끔하게 key 와 value 를 확인할 수 있도록 지향한다.

```bash
ami           = "abc123"
instance_type = "t2.micro"
```

---

resource를 정의할때는 meta-argument(for_each, lifecycle) 를 머리에 위치할지 꼬리에 위치할지 이거에 대한 convention 이 있다.

```bash
resource "aws_instance" "example" {
  count = 2 # meta-argument first

  ami           = "abc123"
  instance_type = "t2.micro"

  network_interface {
    # ...
  }

  lifecycle { # meta-argument block last
    create_before_destroy = true
  }
}

```

---

terraform 은 코드를 포맷팅 하는 기능도 있다.
`terraform fmt` 를 입력하면 현재 디렉토리에 terraform 코드를 깔끔하게 스타일링된다.

---

그리고 terraform 을 간단하게 입력하기 위해 alias 로 환경변수로 지정해두면 편하다.  
`alias tf='terraform'`
