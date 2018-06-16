Rubyソースコード完全解説
http://i.loveruby.net/ja/rhg/book/

↑のメモ


```bash
$ git clone https://github.com/ruby/ruby
$ autoconf # or autoreconf
$ ./configure optflags="-O0" debugflags="-g3"
$ make
$ make install
```

# mac で gdb が使えないとき
https://qiita.com/longtime1116/items/30a49a80749776c4875f

# gdb での探索
rb_p が便利
