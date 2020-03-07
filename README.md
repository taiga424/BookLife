# BookLife DB設計
 
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