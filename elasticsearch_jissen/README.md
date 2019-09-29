# 1章
* Elasticsearch で作成したインデックスるが利用できるのは、1つ先のメジャーリリースまで
  * 5.x 系で作ったインデックスは 6.x 系でも使えるが、7.x 系では使えない

* 特徴4つ(1-2-2)
  * 分散配置による高速化と高可用性の実現
    * シャードの数を増やす => 分散配置による高速化(デフォルトは5)
    * レプリカを増やす => データロスト防止(デフォルトは1)
    * [わかりやすい資料を見つけた](https://www.slideshare.net/snuffkin/elasticsearch-as-a-distributed-system)
  * シンプルな REST API によるアクセス
  * JSONフォーマットに対応した柔軟性の高いドキュメント志向データベース
    * 事前にデータ型をスキーマとして登録しなくても、Elasticsearchは自動的にデータの型を推論してくれる(明示的に指定することも可能)
    * Elasticsearch の文脈において レコードのことをドキュメントとよぶ
    * これにより、スキーマ定義の修正対応が必要！みたいなことがなく、容易にフィールド追加もできる、らしい。
  * ログ収集・可視化などの多様な関連ソフトウェアとの連携
    * Elastic Stack と呼ばれるツール群
    * 可視化 => Kibana
    * ログ収集 => Logstash
    * サーバからのメトリクスデータ収集 => Beats
    * 監視・モニタリング、機械学習による異常検知などの有償アドオン => X-Pack

* Apatch Solr との違い(1-2-3)
  * シャード数、Elasticsearch ではインデックス作成後は変更不可！！
  * Elasticsearch ではシャードの自動リバランスをしてくれる
  * 調停方式、Elasticsearch は内臓の ZEN Discovery、Solr は Zookeeper
    * 調停方式って何？

* Elastic Stack について(1-3)
  * Elasticsearch に加えて Kibana, Logstash, Beats などの周辺ソフトウェアも含めた総称
  * Elasticsearch のバージョンは 2.4 => 5.0 とジャンプしている(2016年)が、これはその Elastic Stack でのバージョンの統一をするために行われたもの(このタイミングで Beats が加わった)

