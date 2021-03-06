### LeanとDevOpsの科学
- 感想
  - とてもよかった。開発チームが質高く高速にデリバリーをしていくためには、どのような要素を改善していけばいいか？を知れたので、大きなヒントを得られた。
  - テックリードを育成しなければならない立場として、だいたいの方向感をつかむことができてよかった。
  - 付録AとBを先に読んでから読み進めたら非常に読みやすかった。
- メモ
  - トランクベースの開発手法の実践
    - 「コードリポジトリでアクティブなブランチの数は3つ未満」「統合前のブランチとフォークの『寿命』は非常に短い(例えば1日未満)」「『コードロック』の期間がほとんど(あるいはまったく)ない」
    - 特に二つ目がすごい。
    - 今のチームでは、ビジネス要求の最小単位でチケットを作り、そのチケットと基本的に一対一対応でブランチを作っているので、そんなに早くトランクにマージできていない。
    - トランクにマージできる最小単位はビジネス要求の最小単位よりもずっと小さいので、ここを完全に分けて考えるとデリバリーのスピードは改善できそう。
    - バーンアウト対策にも。
  - テストの自動化
    - 信頼性が高いテストスイートを用意するのが大事。
    - 今のチームは、自分たちではなく過去の人たちがつくった自動テストを、何が検査されているのかもわからず頼っているので、信頼しきれていないという問題がありそう。
    - だから手動テストを使って安心したいという重力が生まれやすい。
  - チームへのツール選択権限の付与
    - ツールって言ってるけど、gem とかフレームワークとかも含まれるのだろう。
    - これ、そもそも使いたいツールを自分たちで見つけてきたいという意識すらない。
    - 今のやり方を所与としすぎていると思う。めんどくさいのでその気持ちはわかるが、情報を集めて新しいツールを提案する、みたいな動きを作り出せると良さそう。
  - 顧客フィードバックの収集と活用
    - 施策の検討をするやつを、チーム全員の持ち物としてやれると嬉しい。
  - 全業務プロセスの作業フローを可視化
    - リードタイム改善のための調査はこれに繋がるものがある。
  - 作業の細分化
    - 「ブランチを使って複雑な機能を開発し低頻度でリリースするのではなく、迅速な開発が可能な機能に細分化する」
    - トランクベースの開発手法とセットで実践したい。
    - 一人でチケットを分割してやっていくと、結局まとめてやっちゃった方が楽、みたいな感じで大きな単位になってしまいそうだが、二人で取り組むことにして、小分けにしてそれぞれ作業してレビューしあってマージしていくみたいなことができたら面白そう。
    - SVNの方がむしろこういう開発スタイルに自然と傾いていくような重力がありそう(使わないけど)。
  - チームによる実験の奨励・実現
    - 承認を得なくても新たなアイデアを試せる、というのが重要。
    - プロダクトに関する文脈で出てきてるけど、それ以外でもこういうのはやってみたい。
  - WIP制限によるプロセス改善と作業管理
    - ビジュアルディスプレイとセットでやる。
    - 過負荷の予防と、ワークフローの障害要因の明確化のために行う。
  - Westrum推奨の創造的な組織文化の育成
  - 学びの奨励と支援
    - 現時点では、投資として学びを得る仕組みが弱いと思う。
    - たまたまその人の現在の目標が与えられる業務と一致しているから満足度が高い、みたいな場合だと、中長期的に仕組みで成長を担保できているとは言えない。
  - 改善を推進するリーダーシップの実現や支援
    - 「ビジョン」「知的刺激」「心に響くコミュニケーション」「支援を重視するリーダーシップ」「個人に対する評価」
    - どれも自分が重要視しているものだ。

