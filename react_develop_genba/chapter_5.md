* Presentational Component (Functional Component で実現できるはず)
レンダリング
状態を持たない。渡されるpropsを使うのみ。
* Container Component
データ構造やデータの流れ


* Local State
コンポーネントに閉じた状態を持ちたいときは、Functional Component を用いずに state を保持しても良い。
例: ユーザがボタンを押したらMUSTではない情報がニュルッと出てくるようにするときとか。
