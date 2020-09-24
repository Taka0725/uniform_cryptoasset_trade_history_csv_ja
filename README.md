# uniform_cryptoasset_trade_history_csv_ja

## 概要

* このレポジトリでは、日本国内暗号通貨資産取引所が Web 画面経由で取得できる該当利用者の取引履歴の CSV ファイルのフォーマットを記述する。
* また、任意の CSV ファイルがここで規定するフォーマットに準拠しているか否かを検証する Linter と、 実際のサンプル CSV ファイルを用いた推奨事項も記述する。

## 背景と目的

* 従来、日本国内暗号資産取引所からWeb 画面経由で取得できる取引履歴ファイルは、各社ごとにフォーマットが統一されていなかった。
* そのため、利用者は確定申告のための集計作業を各社ごとに実施する必要があり、暗号資産取引サービスを利用するうえでの大きな障害となっていた。
* 本取り組みの目的は、各社が出力する取引履歴の行単位・列単位の書式を統一することにより、確定申告に伴う利用者の集計負担を引き下げることである。

## 提案・質問・アップデートの流れ

* ここで規定するフォーマットについて疑問や訂正事項がある場合、このレポジトリに対して論点ごとに Issue または Pull Request を作成すること。（テンプレート有）
* バージョンの変更は、 [Semantic Versioning](https://semver.org/) に従い、新規 Git tag をつけた時点で更新したものとする。
* 具体的なフォーマットは、下記ファイルにて記述される。
  * 現物取引の場合 ... [`schema_spot.json`](./schema_spot.json)
  * レバレッジ取引の場合 ... [`schema_leverage.json`](./schema_leverage.json)

## 規約の概要

* CSV ファイルの定義は [RFC4180](https://tools.ietf.org/html/rfc4180) に従うものとする。
* CSV ファイルのフォーマットは [W3C: Metadata Vocabulary for Tabular Data](https://www.w3.org/TR/tabular-metadata/) にしたがって、 json 形式で定義する。
* 改行は CRLF(Windows 形式)とする。
* フィールドが `,` (カンマ) `\r\n` (改行)を含む場合、フィールド全体をダブルクオート (`"`) する。フィールド内のダブルクォートは二重のダブルクォートで置き換える `""テキスト""`

### メタデータ

* CSV ファイルのメタデータは、 [W3C の推奨](https://www.w3.org/TR/tabular-metadata/)に基いてテーブルの最上部に `#` をつけたコメント形式で記述する。
* メタデータの一覧
  * `Version` ... 当該 CSV ファイルが従うフォーマットのバージョンを示す。バージョンごとの規約はこのレポジトリ上で同一バージョンのタグをつけたコミットとする。
* サンプル CSV ファイルを参照のこと。

### 列

* 列は、実際にユーザーに対して提示されるデータを示す。現時点で二種類の CSV ファイル形式が規定されている。
  * 現物取引の場合 ... [`schema_spot.json`](./schema_spot.json)
  * レバレッジ取引の場合 ... [`schema_leverage.json`](./schema_leverage.json)

#### 現物取引

* 以下、列ごとの仕様を記述する。
  * T.B.D.（csvlint作成後）
* [現物取引サンプル](./sample/sample_spot.csv)

#### レバレッジ取引

* 以下、列ごとの仕様を記述する。
  * T.B.D.（csvlint作成後）
* [レバレッジ取引サンプル](./sample/sample_leverage.csv)

## csvlint の実行方法

* Unix 環境 (Mac, Linux, etc.) を想定。
* 予め、Docker をインストールしておくこと。
* 任意の csv ファイルがこのレポジトリで指定する規約にしたがっていることを確認するため、[csvlint](https://github.com/Data-Liberation-Front/csvlint.rb) による validation を実行できる。手順は以下
* 作業はこのレポジトリの root ディレクトリで行うものとする。
* 事前に root ディレクトリに対象の CSV をコピーする。
  * 命名は下記のとおり。
    * 現物: `spot.csv`
    * レバレッジ: `leverage.csv`

```sh
# 現物取引の csv validate
cp <対象ファイル> ./spot.csv
./validate_spot.sh

# レバレッジ取引の csv validate
cp <対象ファイル> ./leverage.csv
./validate_leverage.sh
```

## 追加のリソース

* [csvlint](https://github.com/Data-Liberation-Front/csvlint.rb)
