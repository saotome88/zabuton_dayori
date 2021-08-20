# タイトル
"ざぶとんだより"


# 本番環境
https://zabuton-dayori.herokuapp.com/
<br>
<br>
【テストアカウント】
<br>
e-mail: test@test.com  
password: 1234asdf  
nicknama: サンプル太郎  


# はじめに
日本では、落語や講談などの演芸を鑑賞できる劇場を「寄席」と言います。<br>
都内では365日の運営をしている4箇所の寄席が存在しますが、出演者を調べるのはとても面倒という問題点があります。<br>
そんな問題点を解消するための「寄席情報アプリ」として"ざぶとんだより"の開発をしました。


# デモ動画
https://user-images.githubusercontent.com/80328215/130186147-50602604-2c28-4c94-b2c3-15debf7fc475.mov


# アプリ概要
* 都内４箇所の寄席の(アプリに登録されている)出演者情報とTwitterと周辺地図が表示される
* 各演芸場の情報はタブの切り替えによって表示が変更する
* カレンダーの日付別に情報を保存し、対象の日付をクリックするとその日の情報を確認できる
* ユーザーは、新規登録にてアカウントを作成すると番組表に「いいね」が押せて、マイページでは番組表の一覧が表示される
* 管理者でログインをすると、番組表の作成ページへ遷移可能で、投稿ができる


# アプリ開発の理由
私は寄席が好きなので、ファン目線で日頃不満に思っていた下記の問題点を解消したく本アプリを開発しました。
  
* 都内の各寄席は個々での運営のため情報のアクセスが各寄席のHPにアクセスしなければいけないという手間がある
* 空いた日に寄席に行きたくても、どの演芸場で誰が出演しているのかを調べるのが面倒
* 当日の最新情報を知るには、各寄席のTwitterアカウントもチェックしなければいけない
  
  
以上の問題点を解消するため下記の機能を持つアプリを作りました。

* 一度アクセスすれば各寄席の出演者情報を閲覧できる
* 寄席の出演者情報以外に当日の代演や休演情報を知るためのTwitter情報も同じページで確認できる
* ユーザーログインをすれば、好きな番組や、自分が行った番組にいいねを押して、マイページでチェックした番組を確認できる
* 管理者でログインすると、アプリ上で番組表の投稿ができるので継続的な共同運営が可能

# 開発環境
Ruby/Ruby on Rails/MySQL/Github/Visual Studio Code/html&Scss  


# 実装した機能
#### ユーザーログイン機能
  

#### Bootstrapによるレスポンシブデザイン  


#### タブの切り替え表示


#### カレンダーと日付選択による切り替え表示


#### GoogleMap API実装とTwitter表示


#### いいね機能


#### MyPageいいね一覧表示


#### 管理者の投稿機能

  

# これから実装する予定の機能
本アプリ”ざぶとんだより”は開発中のため、下記の機能を今後実装し、2021年中に実際に友人と協力して運営をする予定です。
* 管理者の投稿編集と削除機能
* マイページのメモ機能
* SNSログイン機能
* 非同期通信によるいいね機能

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
  
  
# 各テーブルのカラムとアソシエーション一覧
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
