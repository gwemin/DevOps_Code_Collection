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
<br>

---

<br>

_terraform Cloud 에서 Execution Mode 에서 Local로 바꾸고 해야한다._  
Execution Mode 에서 Remote 로 했을 때 aws 자격증명을 해야하기 때문에 AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY 를 주입해야한다.  
apply 를 했을 때 Level 이 중복되었을때 버그가 일어나는것을 확인했다..  
왜이랬을까?...🕵️‍♂️

### Atlantis

Github, gitlab 처럼 버전컨트롤시스템 상에서 코드 리뷰를 할때 PR에서 테라폼 plan 결과를 확인하고 테라폼 apply를 자동으로 해주는 도구이다.

참조영상 [Youtube](https://www.youtube.com/watch?v=TmIPWda0IKg)  
`atlantis comment` 로 atlantis 를 남기면 해당 변경사항에 대해서 plan 결과를 남기게된다.  
정상적으로 수행되면 `atlantis apply` 로 정상적으로 수행된것을 log파일을 comment로 확인 할 수 있다.
