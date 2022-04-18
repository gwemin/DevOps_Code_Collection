### for

---

<b>set형식</b>

`[for k,v in var.map : length(k) + length(v)]`  
map {} 형식에 있는 key와 value 를 뽑아와서 더한 후 결과를 리스트로 만드는것이다.
ex) {"abc" : "de", "abcd":"edfg"} => [5,8]

`[for i, v in var.list : "${i} is ${v}"]`  
list 원소에 대해서 iteration을 도는데 위에 k대신 index(0~)가 들어간다.  
v 는 똑같이 리스트에 value가 들어간다.

<b>map 형식</b>  
`{for s in var.list : s => upper(s)}`  
ex)["a","b","c"] => {"a" = "A", "b"="B", "c"="C"} 가 된다.

#### Filtering Elements

`[for s in var.list : upper(s) if s != ""]`  
s가 비어있지 않을때만 대문자로 변경해라.  
ex)["a","b",""] => ["A","B"]
