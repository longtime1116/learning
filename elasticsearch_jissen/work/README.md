# docker で Elasticsearch を起動
[公式](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html)にならって進める

* docker イメージを pull する

```bash
$ docker pull docker.elastic.co/elasticsearch/elasticsearch:7.4.0
```

* ↑のリンク先の docker-compose.yml をここにコピーする

* ↓で起動

```bash
$ docker run -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.4.0
```



# 動作確認

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


