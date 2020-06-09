# usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday_year|string|null: false|
|birthday_month|string|null: false|
|birthday_day|string|null: false|
## Association
- belongs_to :delivery_date
- has_many :creditcards
- has_many :comennts
- has_many :products


# delivery_datasテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|zipcode|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|integer||
|phone|integer|
|user|reference|null: false, foreign_key: true|
## Association
- belongs_to :user

# productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|comment|text|null: false|
|price|integer|null: false|
|brand|string||
|size|string||
|shippingcharge|string|null: false|
|area|string|null: false|
|days|string|null: false|
|user|reference|null: false, foreign_key: true|
|category|reference|null: false, foreign_key: true|
## Association
- belongs_to :user
- belongs_to :category
- has_many :comments
- has_many :images

# categorysテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
## Association
- has_many :products

# commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text||
|user|reference|null: false, foreign_key: true|
|product|reference|null: false, foreign_key: true|
## Association
- belongs_to :user
- belongs_to :product

# creditcardsテーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|null: false, foreign_key: true|
|customer|string|null: false|
|card|string|null: false|
## Association
- belongs_to :user

# imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|image|null: false|
|product|reference|null: false, foreign_key: true|
## Association
- belongs_to :product
