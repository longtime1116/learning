# PUT で登録
curl -X PUT "localhost:9200/sample-index/_doc/1?pretty" -H 'Content-Type: application/json' -d '
{
  "price": "1001",
  "created_at": "2019-10-04",
  "content": "PUT: 太郎は走った"
}
'

# POST で登録
curl -X POST "localhost:9200/sample-index/_doc?pretty" -H 'Content-Type: application/json' -d '
{
  "price": "10000",
  "created_at": "2019-10-04",
  "content": "POST: 太郎は走った"
}
'

# たくさん登録していく
curl -X PUT "localhost:9200/sample-index/_doc/2?pretty" -H 'Content-Type: application/json' -d '
{
  "price": "1002",
  "created_at": "2019-09-04",
  "content": "次郎は走った"
}
'
curl -X PUT "localhost:9200/sample-index/_doc/3?pretty" -H 'Content-Type: application/json' -d '
{
  "price": "1003",
  "created_at": "2019-09-04",
  "content": "花子は走った"
}
'

curl -X PUT "localhost:9200/sample-index/_doc/4?pretty" -H 'Content-Type: application/json' -d '
{
  "price": "1004",
  "created_at": "2019-09-04",
  "content": "次郎は歩いた"
}
'
curl -X PUT "localhost:9200/sample-index/_doc/5?pretty" -H 'Content-Type: application/json' -d '
{
  "price": "1005",
  "created_at": "2019-09-04",
  "content": "花子は歩くだろう"
}
'

curl -X PUT "localhost:9200/sample-index/_doc/6?pretty" -H 'Content-Type: application/json' -d '
{
  "price": "1006",
  "created_at": "2019-09-04",
  "content": "三郎は泳いだ"
}
'

curl -X PUT "localhost:9200/sample-index/_doc/6?pretty" -H 'Content-Type: application/json' -d '
{
  "price": "1007",
  "created_at": "2019-09-04",
  "content": "三郎は泳いだ"
}
'
