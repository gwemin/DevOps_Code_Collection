### Terraform

---

<p>처음에 aws region을 한곳에 안두고 옮기면서 했던게 후회다...</p>
<p>Terraform 에서 aws provider 를 사용할때는 aws-cli 자격증명을 확인해봐야 한다. <br>
본인의 쉘에서 <code>aws sts get-caller-identity</code> 를 확인 했을때 계정이 안뜨면 IAM 를 추가해서 권한받은 후 aws-cli 에서 자격증명을 한다.</p>
