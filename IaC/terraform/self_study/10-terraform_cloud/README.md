### 테라폼 상태 저장소 Backend

**Local State (terraform.tfstate) / Remote State (원격 상태)**

개인작업 -> **Local State**  
협업 -> **Remote State**

Local State -> terraform.tfstate
Remote State 는 상태를 원격에 저장한다.  
이 역할을 해주는게 **Terraform Backend** 라고 한다.

**Backend (State Storage)  
→ _Local Backend Locking? 기능을 제공하냐 안하냐_  
→ Remote Backend (Terraform Cloud)  
→ AWS S3 Backend (with Locking O/ withdout DynamoDB Locking X)  
→ console (backend)  
→ kubernetes (backend)**

<details>
<summary><b>Locking 이란 ?</b></summary>
<p>테라폼 원격 코드를 관리하게되면 Local State는 개인작업만 가능하다.
Remote State를 사용하면 여러작업자가 해당 상태관리에서 같은 워크스페이스 관리 가능하다.
그런데 여러 작업자가 작업을 할때 → Issue (동시성 이슈) 를 해결하기 위해 나타난게 user1과 user2가 동시에 한다해도 한명한테 실행권한을 주고 lock을 걸어줘서 다음 실행요청을 한 user2는 lock이 걸려있으니까 다음에 시도하라는 안내메시지를 띄어주고 끝난다.</p>
</details>

_terraform Cloud 에서 Execution Mode 에서 Local로 바꾸고 해야한다._
