# Name
「さぶとんだより」
  
https://zabuton-dayori.herokuapp.com/

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


https://user-images.githubusercontent.com/80328215/128703926-d3bfdff3-9a5c-4ca5-a976-9345d0d08356.mp4



# Requirement
開 発 環 境：Ruby/Ruby on Rails/MySQL/Github/Visual Studio Code/html&Scss  

# 実装した機能
* ユーザーログイン機能
![スクリーンショット 2021-08-06 1 29 28](https://user-images.githubusercontent.com/80328215/128386832-7b2b7957-4464-49f0-a196-acd4eb3ad56b.png)
![スクリーンショット 2021-08-06 1 29 45](https://user-images.githubusercontent.com/80328215/128386835-255f647b-7062-4342-8fb7-4e02d5e9b126.png)
![スクリーンショット 2021-08-06 1 30 00](https://user-images.githubusercontent.com/80328215/128386838-26b404d1-0925-4f0a-acfa-fb2447b211a0.png)
  
* Bootstrapによるレスポンシブデザイン  
![スクリーンショット 2021-08-06 1 31 29](https://user-images.githubusercontent.com/80328215/128387082-051c0605-e9c9-467f-a068-5645f330e53e.png)
  
* 管理者の投稿機能
![スクリーンショット 2021-08-06 1 33 25](https://user-images.githubusercontent.com/80328215/128387328-a66746a8-e85b-411a-8be6-ebef36c8c884.png)
![スクリーンショット 2021-08-06 1 33 40](https://user-images.githubusercontent.com/80328215/128387331-c8db612a-d120-4417-a21a-752a3d97e167.png)
  
* タブの切り替え表示機能
* いいね機能
  
![スクリーンショット 2021-08-06 1 34 30](https://user-images.githubusercontent.com/80328215/128387544-792dbe87-ab2c-4548-bcba-a19db9518997.png)

* カレンダー表示と日付選択機能
* GoogleMap API実装
* Twitter表示機能
![スクリーンショット 2021-08-06 1 35 21](https://user-images.githubusercontent.com/80328215/128387576-3b346de6-0551-46f2-8543-b1925802254c.png)
  

# これから実装する機能
* 管理者の投稿編集と削除機能
* マイページのメモ機能
* SNSログイン機能
* 非同期通信によるいいね機能
* 非同期通信によるカレンダー日付選択機能


# データベース設計
<img width="703" alt="スクリーンショット 2021-08-06 1 18 32" src="https://user-images.githubusercontent.com/80328215/128385231-6bc1c11c-2ff1-44e5-b204-2c22eab4c9c6.png">

# ローカルでの動作方法
* ruby 2.6.5
* Rails 6.0.4
* mysql2
  
【設定手順】  
- gh repo clone saotome88/zabuton_dayori
- bundle install
- rails db:create
- rails db:migrate
  
  
  
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
