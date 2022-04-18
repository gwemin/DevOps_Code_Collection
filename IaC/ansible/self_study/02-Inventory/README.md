### Inventory

대상 서버 호스트를 관리하는 파일  
그룹 기능 지원  
Static Inventory(정적)  
Dynamic Inventory(동적) -> Auto스케일링을 이용하거나, 인스턴스의 IP가 빈번히 바뀔수 있을때 이용한다.
확장자는 필요하지 않은데 인벤토리의 약자로 .inv 로 지정해놨다.

IP를 사용하거나 도메인을 사용할 수 있는데 편한걸로 사용하면된다.

**Group** 기능이 있는데 all 이라는 그룹은 기본그룹은 인벤토리에 정의되어있는 모든그룹을 포함하고 있다.

`alias.inv` 코드처럼 별칭을 사용할 수 있는데 IP 나 도메인을 사용할 수 있다.

---

`vars.inv` Agentless -> ssh / win_rm 원격명령을 수행하는데 그럴때  
ssh로 로그인할 때 사용자 정보를 알아야하는데 amazon, aws 에서 기본사용자를 지정해주는 것이다.  
하위그룹 기능은 linux:children 으로 linux 라는 그룹은 amazon, ubuntu 를 포함한다.  
 4가지 호스트를 가지고 있다.

#### Tip

- 앤서블을 계속 사용할거라면 Dynamic Inventory는 알아야 한다.
- Group_vars 와 Host_vars 이해를 해야만 고급수준에서 이용할 수 있다.
