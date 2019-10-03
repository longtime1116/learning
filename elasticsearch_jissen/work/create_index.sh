curl -X PUT "localhost:9200/sample-index" -H "" -H 'Content-Type: application/json' -d '
{
  "settings": {
    "number_of_shards": "3",
    "number_of_replicas": "2"
  },
  "mappings": {
    "properties": {
      "price": { "type": "integer" },
      "created_at": { "type": "date" },
      "content": { "type": "text" }
    }
  }
}
'
