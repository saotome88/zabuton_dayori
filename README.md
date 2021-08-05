# Name
さぶとんだより
<a href="https://zabuton-dayori.herokuapp.com/" alt="zabuton_dayori"></a>

* テストアカウント
e-mail: test@test.com  
password: 1234asdf  
nicknama: サンプル太郎  

【アプリ概要】
* 都内４箇所の寄席の出演者情報を表示する  
* 新規登録にてアカウントを作成すると番組表にいいねが押せてマイページで一覧を表示できる  

# Description
私が考えた寄席演芸の世界での下記の問題点を解消したアプリです  
* 都内の各寄席は個々での運営のため情報のアクセスが各寄席のHPアクセスするという手間があった
* 最新情報を知るには、各寄席のアカウントもチェックしなければいけない

以上の問題点を解消するため下記の機能を持つアプリを作りました  
* 一度アクセスすれば各寄席の出演者情報を閲覧できる
* 寄席の出演者情報以外に当日の代演や休演情報を知るためのTwitter情報も同じページで確認できる
* ユーザーログインをすれば、好きな番組や、自分が行った番組にいいねを押してマイページで管理ができる
* 管理者権限を付け、管理者はアプリ上で番組表の投稿や編集削除ができる

# DEMO
<a href="https://gyazo.com/1bc16588349ae255b5fff486b927a9f8"><img src="https://i.gyazo.com/1bc16588349ae255b5fff486b927a9f8.gif" alt="Image from Gyazo" width="1000"/></a>

# Requirement
開 発 環 境：Ruby/Ruby on Rails/MySQL/Github/Visual Studio Code/html&Scss  
* ruby 2.6.5
* mysql2

# 実装した機能

## Usersテーブル
| Colum              | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| encrypted_password | string | null: false               |

### Association
-has_many :reaction_likes
-has_many :reaction_hopes
-has_many :reaction_pasts
-has_many :memos
-has_many :mystages


## Eventsテーブル
| Colum              | Type       | Options                        |
|--------------------|------------|--------------------------------|
| theatername        | string     | null: false                    |
| startday           | date       | null: false                    |
| daynight           | string     | null: false                    |

### Association
-has_many :reaction_likes
-has_many :users, through: :reaction_likes
-has_many :event_comedians
-has_many :comedians, through: :event_comedians

#### 追加実装用
-has_many :reaction_hopes
-has_many :reaction_pasts


## EventComediansテーブル
| Colum         | Type       | Options                        |
|---------------|------------|--------------------------------|
| event         | references | null: false, foreign_key: true |
| comedian_id   | intger     | null: false                    |
*event_comedianはActivehashで管理するため、integer型にする。
※comedianクラスに名前の保存。event_comesianクラスは中間テーブルとなる。

### Association
-belongs_to :event
-belongs_to :comedian_id


## Reaction_likesテーブル
| Colum       | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references |              foreign_key: true |
| event       | references | null: false, foreign_key: true |
*リアクションボタンは誰でも押せるようにするため、userカラムにnullは定義しない

### Association
-belongs_to :user
-belongs_to :event


## Reaction_hopesテーブル
| Colum       | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references |              foreign_key: true |
| event       | references | null: false, foreign_key: true |
*リアクションボタンは誰でも押せるようにするためnullは定義しない

### Association
-belongs_to :user
-belongs_to :event


## Reaction_pastsテーブル
| Colum       | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references |              foreign_key: true |
| event       | references | null: false, foreign_key: true |
## リアクションボタンは誰でも押せるようにするためnullは定義しない

### Association
-belongs_to :user
-belongs_to :event


## Memosテーブル
| Colum         | Type       | Options                        |
|---------------|------------|--------------------------------|
| user          | references | null: false, foreign_key: true |
| event         | references | null: false, foreign_key: true |
| memo          | text       | null: false                    |

### Association
-belongs_to :user
-belongs_to :event


## Mystagesテーブル
| Colum         | Type       | Options                        |
|---------------|------------|--------------------------------|
| user          | references | null: false, foreign_key: true |
| mystage       | text       | null: false                    |

### Association
-belongs_to :user