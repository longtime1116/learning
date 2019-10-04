#echo "==== GET /sample-index/_doc/1 ===="
## 1つだけ確認
#curl -XGET "http://localhost:9200/sample-index/_doc/1?pretty"
#
#echo "==== GET /sample-index/_doc/1/_source ===="
## 1つだけ、かつドキュメント部分のみ確認
#curl -XGET "http://localhost:9200/sample-index/_doc/1/_source?pretty"

echo "====match_all===="
# 全部確認
curl -XGET "http://localhost:9200/sample-index/_search?pretty" -H 'Content-Type: application/json' -d'{  "query": {    "match_all": {}  }}'

