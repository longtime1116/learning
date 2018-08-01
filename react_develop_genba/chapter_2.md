# React の特徴

* 宣言的

JQuery だと手続き的
例えばフォームに文字列が入力されていくとき、文字数をチェックして 20 文字以降ならこのイベントを発火する、みたいなフローを経て挙動が変わる。
React だと、条件に対する状態が既に定義としてあるので、状態に見合ったものが瞬間的に描画される

* Component-Based
部品の組み合わせで構築していく

* Learn Once, Write Anywhere
異なる環境に描画できるReactコンポーネント
UIコンポーネントはプラットフォームに依存しない


# JSX
JSX はあくまで糖衣構文で、JSを書いているのだというのを忘れてはならない。

## Babel
JSXとか、ブラウザはそのまま表示できない。
なのでトランスパイル必要がある。
そのために Babel を使う。

# Rectの記述方法
## render
render について
* レンダリングが目的
* 何度も呼ばれることがある
* 冪等性が大事

render メソッド内での定義は、その描画処理が何度も実行されるため望ましくない

## Functional Components
関数で表されるコンポーネントだから。

```js
const Hello = () => {
  return <p> Hello! </p>
}
```

## Props
props を引数として渡すと view を返すのが単純な react のコンポーネント
HTML の考え方でJSXを触るよりも、JavaScript を利用して結果的に View を形作っていく視点が正解。

## State
State での保持は React.Component を継承するクラスでしか使用できないので、Functional Components では使用不可。
なので、Functional Components は Stateless Functional Components とも呼ばれる。
constructor で super() 後に初期化する。
constructor に `this.handleClick = this.handleClick.bind(this)` のような記述をすることで、継承を使い Class 定義された React Component に this をバインドすることができる。
換言すると、handleClick 関数内でのスコープを、↑で定義した this にすることができる。

## key

key があると、より効率的に component 描画を行うことができる。

```html
<ul>
  <li>cat</li>
  <li>dog</li>
</ul>
```

ここの先頭に lion を追加した場合、key が無いと diff が +3行の-2行になってしまうので、レンダリングに無駄が多い。
しかし、keyがあれば内部的にkeyを差分検知に用いて+1行で済ませてくれる。
key は一意であることが保証されることが望ましい。

# ライフサイクル
## 処理の流れ
v17 から削除されるメソッドが多いので注意が必要

# 書きたいページ
p47-48
p49-50
p51
