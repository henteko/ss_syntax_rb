# ss記法
[![Build Status](https://travis-ci.org/henteko/ss_syntax_rb.svg?branch=master)](https://travis-ci.org/henteko/ss_syntax_rb)

## インストール

```sh
gem install ss_syntax

# or

gem 'ss_syntax'
bundle install
```

## 使い方

```sh
$ sssy example/example.ss // default -t
$ sssy --html example/example.ss // puts html
```

or

```rb
require 'ss_syntax'

text = SsSyntax::SsSyntax.new(src).parse() # default :text
html = SsSyntax::SsSyntax.new(src, :html).parse()
```

## 各記法

### 登場人物名ショートカット

```
# * [ショートカット名] [名前]
# - [ショートカット名] [名前]
# これは本文には反映されない

* 1 男
* 2 女
- osana 幼 # 数字じゃなくてもいい
```

### 発言

```
* 1 男

# 以下はどちらも同じ結果になる
男: 今日は眠い
1: 今日は眠い

# 擬音も書ける
1: 眠い :zzz

# 結果
# 男「今日は眠い」
# 男「眠い」zzz
```

### 心の声

```
* 1 男

1_ 女は今日も可愛いなぁ

# 擬音
1_ わかる _ zzz

# 結果
# 男（女は今日も可愛いなぁ）
# 男（わかる）zzz
```

### 地の文

```
そのまま書けばそれが地の文になる
```

### コメント

```
# をつけるとその行はコメント扱いされる
# 本文には反映されない
```
