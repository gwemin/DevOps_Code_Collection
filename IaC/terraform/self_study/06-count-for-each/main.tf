provider "aws" {
  region = "ap-northeast-2"
}

// cout / for_each 를 사용하지 않았을때 단순 반복 작업
# resource "aws_iam_user" "user_1" {
#   name = "user-1"
# }

# resource "aws_iam_user" "user_2" {
#   name = "user-2"
# }

# resource "aws_iam_user" "user_3" {
#   name = "user-3"
# }
# output "user_arns" {
#   value = [
#     aws_iam_user.user_1.arn,
#     aws_iam_user.user_2.arn,
#     aws_iam_user.user_3.arn,
#   ]
# }


# count  -> resource / data / module 에서도 사용가능
# resource "aws_iam_user" "count" {
#     count = 10 # meta-argument

#     name = "count-user-${count.index}" # 0~9
# }

# output "count_user_arns" {
#     value = aws_iam_user.count.*.arn
# }


# for_each
# resource "aws_iam_user" "for_each_set" {
#     for_each = toset([ # set / map 지원 
#     # set -> List Unique 한 Element [1,2,3] O   [1,2,2,3] X
#     # map -> hash, Object 형식 {key:value,key1:value2} 
#         "for-each-set-user-1",
#         "for-each-set-user-2",
#         "for-each-set-user-3",
#     ])
#     # map -> each.key , each.value 가 생김, set 에서는 each.key == each.value 같음
#     name = each.key  
# }


# output "for_each_set_user_arns" {
#   value = values(aws_iam_user.for_each_set).*.arn
#   # count 는 List 가 들어갔지만 for_each 는 Object
#   # keys는 object의 key만 가져오고, values는 object의 value만 가져온다.
# }


# for_each map 이용
resource "aws_iam_user" "for_each_map" {
  for_each = {
    # key 는 String 이어야 한다.
    alice = {
      level   = "low"
      manager = "posquit0"
    }
    bob = {
      level   = "mid"
      manager = "posquit0"
    }
    john = {
      level   = "high"
      manager = "steve"
    }
  }

  name = each.key
}

output "for_each_map_user" {
    value = values(aws_iam_user.for_each_map).*.arn
  
}