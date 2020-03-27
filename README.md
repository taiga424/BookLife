# BookLife
コンセプト：「私のオススメの本をあなたに。」
投稿されたレビューを見て、気になった本を書店ですぐ探せるように。

# DEMO
[![Image from Gyazo](https://i.gyazo.com/0ec17225e3b4e240007f55d60d16cea1.png)](https://gyazo.com/0ec17225e3b4e240007f55d60d16cea1)

# Features
オススメしたい書籍をレビューと共に投稿し、その投稿を見てその書籍に興味を持ったユーザーが、書店ですぐその本を探せるように、タイトル、作者、出版社、ジャンルもひと目でわかるようになっている。

# BackGround
本屋に務めていたことがあり、その際にお客様から本の場所を聞かれるが、数ある本の中から探すとなると、ある程度の情報がないと探すのに時間がかかってしまう。そこでその書籍の全ての情報が見ればひと目でわかるサイトがあればと思い開発を開始した。

# Note
初めての開発だったので、シンプルな実装になっている。
AWSを利用してデプロイ済みだが、まだまだやり残したことが多い。

# DB schema
## booksテーブル
 
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|image|string|
|author|string|
|publisher|string|
|review|text|null: true|
|user_id|integer|
|likes_count|integer|
 
### Association
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :book_categories, dependent: :destroy
- has_many :categories, through: :book_categories
 

## usersテーブル
 
|Column|Type|Options|
|------|----|-------|
|nickname|string|
|email|string|null: false|
|password|string|null: false|
 
### Association
- has_many :books, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes,dependent: :destroy
 

## commentsテーブル
 
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user|references|null: false, foreign_key: true|
|book|references|null: false, foreign_key: true|
 
### Association
- belongs_to :user
- belongs_to :book
 

## likesテーブル
 
|Column|Type|Options|
|------|----|-------|
|user|references|
|book|references|
 
### Association
- belongs_to :user
- belongs_to :book, counter_cache: :likes_count


## categoriesテーブル
 
|Column|Type|Options|
|------|----|-------|
|name|string|
 
### Association
- has_many :book_categories
- has_many :books, through: :book_categories


## book_categoriesテーブル
 
|Column|Type|Options|
|------|----|-------|
|category|references|foreign_key: true|
|book|references|foreign_key: true|
 
### Association
- belongs_to :book
- belongs_to :category

# Usage
`git clone https://github.com/taiga424/BookLife.git`  
`cd BookLife`  
`rails db:create`  
`rails db:migrate`  
`rails db:seed`  
`rails s`