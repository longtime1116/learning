[CDP](http://aws.clouddesignpattern.org/index.php/%E3%83%A1%E3%82%A4%E3%83%B3%E3%83%9A%E3%83%BC%E3%82%B8)

# 事前
- [x] 基本用語
- [x] クラウドコンポーネント

# デザインパターン
## 基本のパターン
- [x] Snapshotパターン（データのバックアップ）
  - EBS(Amazon Elastic Block Store) を使って snapshot を取得する。snapshot は S3 に保存される。ちなみに RDS の DB インスタンスは、データベースおよびログのストレージに EBS を使っている。
- [x] Stampパターン（サーバの複製）
  - EC2 から AMI(Amazon Machine Images) を作れば、AMI を基に複数の EC2 を作成できる。環境設定済みの仮想サーバを複製できる。
- [ ] Scale Upパターン（動的なサーバのスペックアップ／ダウン）
- [ ] Scale Outパターン（サーバ数の動的増減）
- [ ] Ondemand Diskパターン（動的なディスク容量の増減）
## 可用性を向上するパターン
- [ ] Multi-Serverパターン（サーバの冗長化）
- [ ] Multi-Datacenterパターン（データセンターレベルの冗長化）
- [ ] Floating IPパターン（IPアドレスの動的な移動）
- [ ] Deep Health Checkパターン（システムのヘルスチェック）
- [ ] Routing-Based HAパターン（ルーティングによる接続先の透過的な切り替え）
## 動的コンテンツを処理するパターン
- [ ] Clone Serverパターン（サーバのクローン）
- [ ] NFS Sharingパターン（共有コンテンツの利用）
- [ ] NFS Replicaパターン（共有コンテンツの複製）
- [ ] State Sharingパターン（ステート情報の共有）
- [ ] URL Rewritingパターン（静的コンテンツの退避）
- [ ] Rewrite Proxyパターン（URL書き換えプロキシの設置）
- [ ] Cache Proxyパターン（キャッシュの設置）
- [ ] Scheduled Scale Outパターン（サーバ数のスケジュールにあわせた増減）
- [ ] IP Poolingパターン（接続許可済みIPアドレスのプール）
## 静的コンテンツを処理するパターン
- [ ] Web Storageパターン（可用性の高いインターネットストレージ活用）
- [ ] Direct Hostingパターン（インターネットストレージで直接ホスティング）
- [ ] Private Distributionパターン（特定ユーザへのデータ配布）
- [ ] Cache Distributionパターン（ユーザに物理的に近い位置へのデータ配置）
- [ ] Rename Distributionパターン（変更遅延のない配信）
- [ ] Private Cache Distributionパターン（CDNを用いたプライベート配信）
- [ ] Latency Based Origin（地域によりオリジンサーバを変更）
## データをアップロードするパターン
- [ ] Write Proxyパターン（インターネットストレージへの高速アップロード）
- [ ] Storage Indexパターン（インターネットストレージの効率化）
- [ ] Direct Object Uploadパターン（アップロード手順の簡略化）
 レーショナルデータベースのパターン
- [ ] DB Replicationパターン（オンラインDBの複製）
- [ ] Read Replicaパターン（読込専用レプリカによる負荷分散）
- [ ] Inmemory DB Cacheパターン（頻度の高いデータのキャッシュ化）
- [ ] Sharding Writeパターン（書き込みの効率化）
## 非同期処理/バッチ処理のパターン
- [ ] Queuing Chainパターン（システムの疎結合化）
- [ ] Priority Queueパターン（優先順位の変更）
- [ ] Job Observerパターン（ジョブの監視とサーバの追加・削除）
- [ ] Fanoutパターン（複数種類の処理を非同期かつ並列に実行）
## 運用保守のパターン
- [ ] Bootstrapパターン（起動設定の自動取得）
- [ ] Cloud DIパターン（変更が多い部分の外出し）
- [ ] Stack Deploymentパターン（サーバ群立ち上げのテンプレート化）
- [ ] Server Swappingパターン（サーバの移行）
- [ ] Monitoring Integrationパターン（モニタリングツールの一元化）
- [ ] Weighted Transitionパターン（重みづけラウンドロビンDNSを使った移行）
- [ ] Log Aggregation パターン(ログの集約)
- [ ] Ondemand Activationパターン（メンテナンス時の一時的な設定変更）
## ネットワークのパターン
- [ ] Backnetパターン（管理用ネットワークの設置）
- [ ] Functional Firewallパターン（階層的アクセス制限）
- [ ] Operational Firewallパターン（機能別アクセス制限）
- [ ] Multi Load Balancerパターン（複数ロードバランサの設置）
- [ ] WAF Proxyパターン（高価なWeb Application Firewallの効率的な活用）
- [ ] CloudHubパターン（VPN拠点の設置）
- [ ] Sorry Pageパターン(バックアップサイトへの自動切り替え)
- [ ] Self Registrationパターン（自分の情報をデータベースに自動登録）
- [ ] RDP Proxyパターン（Windowsインスタンスへのセキュアなアクセス）
- [ ] Floating Gatewayパターン（クラウド上のネットワーク環境の切り替え）
- [ ] Shared Serviceパターン(システム共通サービスの共用化)
- [ ] High Availability NATパターン(冗長化されたNATインスタンス)
