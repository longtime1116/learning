echo "===== 太 ====="
curl -XGET "http://localhost:9200/sample-index/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "query": {
    "match": {
      "content": "太"
    }
  }
}
'

echo "===== 走る ====="
curl -XGET "http://localhost:9200/sample-index/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "query": {
    "bool": {
      "must": [
        {
          "match": {
            "content": "走る"
          }
        },
        {
          "range": {
            "price": {
              "gte": "1002",
              "lte": "1010"
            }
          }
        }
      ]
    }
  }
}
'
