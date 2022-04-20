### module 작성방법

---

**account -> module  
versions.tf -> provider / module 버전의존성
main.tf -> resource / data / module / local
outputs -> output  
README.md -> 문서역할**

<br>
root module -> child module -> child module  
처럼 만들수도 있지만 이슈가 생겼을때 문제점을 파악하기 어려울수도 있기 때문에 깊이를 어느정도 조절하자!!!
