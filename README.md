# ss記法

## 使い方

```sh
$ ssnotation example/example.ss // default -t
$ ssnotation --html example/example.ss // puts html
```

or

```rb
require 'ssnotation'

text = SsNotation::SsNotation.new(src).parse() # default :text
html = SsNotation::SsNotation.new(src, :html).parse()
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

# 結果
# 男「今日は眠い」
```

### 心の声

```
* 1 男

1_ 女は今日も可愛いなぁ

# 結果
# 男（女は今日も可愛いなぁ）
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
