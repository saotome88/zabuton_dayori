# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

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
| comedian_id        | integer    | null: false                    |
*comedianはActivehashで管理するため、integer型にする。

### Association
-has_many :reaction_likes
-has_many :reaction_hopes
-has_many :reaction_pasts
-has_many :memos


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
| memo          | string     | null: false                    |

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