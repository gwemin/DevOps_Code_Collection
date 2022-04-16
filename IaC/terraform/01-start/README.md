<h3> terraform 다뤄보기 </h3>

<details>
  <summary>terraform 이란?</summary>
  </br>
    <p>HashiCorp 에서 만든 Iac 도구이다.</p>
</details>

<details>
  <summary>핵심 키워드 3가지 Write, plan, apply</summary>
  </br>
    <p>Write : HCL 이라는 문법을 토대로 복잡한 인프라를 HCL로 정의할 수 있다.</p>
    <p>plan : 추가, 변경, 삭제 된 리소스들을 확인할 수 있게된다.</p>
    <p>apply : 실제로 인프라에다가 변경사항을 적용할 수 있게된다.</p>
</details>

terraform에서 많이보게 되는 **provider agnostic** 프로바이더에 의존하지않는 이라는 뜻이다.

terraform은 여러 provider를 지원해준다.
각 provider 를 가져다가 해당 프로바이더에 맞는 테라폼 코드를 작성할 수 있다.  
tf aws -> aws 인프라 관리  
tf gcp -> gcp 인프라 관리  
이런식이다.

terraform 을 학습하고 실무에서 사용하다보면 [Terraform](https://www.terraform.io/) Registry, Docs 를 켜두고 보게되는 문서이다.

[Registry](https://registry.terraform.io/)는 패키지 저장소 같은 곳이다.  
browse Providers 는 AWS, GCP, Azure, k8s  
Browse Modules 는 인프라 리소스 그룹 템플릿

인프라를 코드로 관리하다보면 협업을 원할하게 할 수 있는 장점이 있다.  
혼자 관리하면 테라폼코드를 수정하고 plan을 토대로 리뷰하고 paln 결과를 apply 하는 식으로 진행하게 된다.

협업을 하면 Git에다가 내가 인프라에 어떤걸 변경사항을 만들려고 한다는 PR을 요청을 하게 된다.  
CI 파이프라인,Github Bot을 통해서 terraform plan 결과를 PR Comment로 남기게 된다.  
PR Reviwer가 검토 후 Approve 하거나 Deny 하고 변경요청을 할 수도 있다.  
PR Reviwer가 Approve 하면 apply 시킬 수 있게 된다.

terraform cloud 로 좀더 현업을 원할하게 할 수 도 있다.
