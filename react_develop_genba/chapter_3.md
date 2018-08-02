Atomic Design は、小さい部品を集めていい感じの view を作ろうというやつ。コンポーネント指向的。

* Atoms(原子)
* Molecules(分子)
* Organisms(有機物)
* Templates
* Pages

Atoms は本当に最小単位の部品。ボタンとか、
Molecules はそれが結合して意味を持つ最小の部品。入力フォームとか(ボタンとテキストボックスで作られる)。再利用性が求められる。
Organisms は Atoms と Molecles の複合体。Header とか。再利用性は求められない。
Templates はワイヤーフレームと同様、ページに表示する実データが反映される前の状態。
Pages は Templates のインスタンス
