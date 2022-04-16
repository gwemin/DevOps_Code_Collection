### terraform modules

---

NAT 인스턴스, NAT Gateway 는 과금서비스 이다.
라우팅 테이블 -> 서브넷은 각각 2개의 subnet이 연결된다.
fastcampus-private: 10.0.0.0/16(local) 만 라우팅 된다.  
fastcampus-public : 10.0.0.0/16(local), 0.0.0.0/0 는 internetGateway(igw) 로 라우팅한다.

<br>

`main.tf` 에서 [module](https://github.com/tedilabs/terraform-aws-network/tree/main/modules)은 terraform registry에 올려놓고 사용하였다. (module 코드를 살펴보자)
