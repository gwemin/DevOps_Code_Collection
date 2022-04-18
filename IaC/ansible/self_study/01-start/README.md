### 형상관리

---

GitOps 가 가능해짐  
서버 운영체제 상에 필요한 소프트웨어를 설치하고 원하는 설정으로 관리하는 것  
Configuration as Code 라고도 불림  
대표적인 형상 관리 도구로 Ansible, Puppet, Chef, Salt Stack 등이 있다.  
Ansible 은 python으로 만들어졌다.

### 앤서블의 유즈케이스

- Application
- **Security Compliance**
- Continuous Delivery
- Provisioning
- **Configuration Management**

### 왜 앤서블을 사용할까?

Shell Script 을 이용하였었는데 아래코드와 같이 조건문이 있는 이유는  
여러번 실행하였을때 동일한 결과를 얻기 위함이다.(멱등성)

```bash
    which=`which monogod 2>&1 >/dev/null`
    if [ $? -eq 0 ]; then
        if [ "$INSTALLED_MONGO" == "$MONGO_VERSION" ]; then
        echo "Mongo Server version is current and up to date"
    fi
    if [ "$INSTALLED_MONGO" == "$MONGO_VERSION" ]; then
        remove_mongo_server
        install_mongo_server
    fi
    else
        install_mongo_server
    fi
```

#### 그런데

아래와 같이 사용가능하다.

```yaml
    - name: install mongodb
        yum: name=mongodb-server-2.6 state=installed
```

- 간단한 YAML 문법
- 멱등성을 보장하여 여러번 실행해도 안전함
- ssh / win_rm 기반으로 통신 -> 대상 서버에 에이전트 설치가 필요하지 않음
- 여러 서버를 대상을 동시 실행
- 특정 서버들을 타겟팅할 수 있음
- 버전관리하기에 용이함 -> GitOps 가능
