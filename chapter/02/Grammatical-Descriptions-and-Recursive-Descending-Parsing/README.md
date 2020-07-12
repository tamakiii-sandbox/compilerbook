# Grammatical Descriptions and Recursive Descending Parsing

- 「演算子の優先順位」（operator precedence）
- 「構文木」（こうぶんぎ、syntax tree）
- 「抽象構文木」（abstract syntax tree、AST）
- 「生成規則」（production rule）
- BNF（Backus–Naur form）
- EBNF（Extended BNF）
- 「終端記号」（terminal symbol）
- 「非終端記号」（nonterminal symbol）
- 「文脈自由文法」（context free grammar）
- 何もないことを表す記号としてε（イプシロン）を右辺に書いておくというのが普通のBNFのルール

EBNFでは、BNFのルールに加えて、以下の記号を使って複雑なルールを簡潔に書き下すことができます。

書き方 | 意味
-- | --
A* | Aの0回以上の繰り返し
A? | Aまたはε
A \| B | AまたはB
( ... ) | グループ化


以下のように書き換えることで、EBNFをBNFに変換することができる

書き方 | 意味
-- | --
A* | Aの0回以上の繰り返し
A? | Aまたはε
A \| B | AまたはB
( ... ) | グループ化


## Simple Generation Rules
```sh
expr = num ("+" num | "-" num)*
```
```sh
expr → num → "1"
```
```sh
expr → num "+" num
     → "10" "+" "5"
```
```sh
     expr → num "-" num "+" num
          → "42" "-" "30" "+" "2"
```
- 「具象構文木」（concrete syntax tree）

## Expression of operator precedence by generation rules
```sh
expr = mul ("+" mul | "-" mul)*
mul  = num ("*" num | "/" num)*
zzz
```
## Generating Rules with Recursion
```sh
expr    = mul ("+" mul | "-" mul)*
mul     = primary ("*" primary | "/" primary)*
primary = num | "(" expr ")"
```

## recursive descent parsing
```sh
expr    = mul ("+" mul | "-" mul)*
mul     = primary ("*" primary | "/" primary)*
primary = num | "(" expr ")"
```
