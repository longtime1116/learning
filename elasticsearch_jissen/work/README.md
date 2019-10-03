# docker で Elasticsearch を起動
[公式](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html)にならって進める

* docker イメージを pull する

```bash
$ docker pull docker.elastic.co/elasticsearch/elasticsearch:7.4.0
$ docker pull kibana:7.4.0
```

* docker-compose.yml を用意する。基本は↑の公式のものを使い、プラスで[こちらのKibanaのページ](https://www.elastic.co/guide/en/kibana/current/docker.html)を参考にして kibana 設定を行う
* ↓で起動

```bash
$ docker-compose up
```

# コンテナが立ち上がっていることを確認

```bash
$ curl -XGET http://localhost:9200/_cluster/health?pretty

```

```bash
{
  "cluster_name" : "docker-cluster",
  "status" : "green",
  "timed_out" : false,
  "number_of_nodes" : 2,
  "number_of_data_nodes" : 2,
  "active_primary_shards" : 0,
  "active_shards" : 0,
  "relocating_shards" : 0,
  "initializing_shards" : 0,
  "unassigned_shards" : 0,
  "delayed_unassigned_shards" : 0,
  "number_of_pending_tasks" : 0,
  "number_of_in_flight_fetch" : 0,
  "task_max_waiting_in_queue_millis" : 0,
  "active_shards_percent_as_number" : 100.0
}
```


# インデックス作成
* ここでは設定とマッピング定義を同時に行うが、個別に行うことも可能

```bash
$ cat create_index.sh
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

$ sh create_index.sh
{"acknowledged":true,"shards_acknowledged":true,"index":"sample-index"}
```

* 確認

```bash
$ curl -X GET "localhost:9200/sample-index?pretty"
{
  "sample-index" : {
    "aliases" : { },
    "mappings" : {
      "properties" : {
        "content" : {
          "type" : "text"
        },
        "created_at" : {
          "type" : "date"
        },
        "price" : {
          "type" : "integer"
        }
      }
    },
    "settings" : {
      "index" : {
        "creation_date" : "1570105082019",
        "number_of_shards" : "3",
        "number_of_replicas" : "2",
        "uuid" : "E4CwFs8QR7ek0bKKO2aieg",
        "version" : {
          "created" : "7040099"
        },
        "provided_name" : "sample-index"
      }
    }
  }
}
```

# 削除

```bash
$ curl -X DELETE "localhost:9200/sample-index?pretty"
{
  "acknowledged" : true
}

```
