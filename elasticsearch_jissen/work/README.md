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


# ドキュメントタイプ作成

* ドキュメントタイプ作成

```bash
$cat document_type.sh
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

$ sh document_type.sh
{
  "acknowledged" : true,
  "shards_acknowledged" : true,
  "index" : "sample-index"
}
```

* 確認

```bash
$ curl -X GET "localhost:9200/sample-index/?pretty"
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
        "creation_date" : "1570103952779",
        "number_of_shards" : "1",
        "number_of_replicas" : "1",
        "uuid" : "jkw-6-33Qhq4crj8D8uDpw",
        "version" : {
          "created" : "7040099"
        },
        "provided_name" : "sample-index"
      }
    }
  }
}
```

あるいは

```bash
$ curl -X GET "localhost:9200/sample-index/_mapping?pretty"
{
  "sample-index" : {
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
