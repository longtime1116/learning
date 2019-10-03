curl -X PUT "localhost:9200/sample-index?pretty" -H 'Content-Type: application/json' -d '
{
  "mappings": {
    "properties": {
      "price": { "type": "integer" },
      "created_at": { "type": "date" },
      "content": { "type": "text" }
    }
  }
}
'
