# create_usersテーブル
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
- belongs_to :delivery_date　dependent: :destroy
- has_many :creditcards　dependent: :destroy
- has_many :comennts　dependent: :destroy
- has_many :products　dependent: :destroy


# delivery_datasテーブル
|Column|Type|Options|
|------|----|-------|
|zipcode|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|integer||
|phone|integer|
|create_user|reference|null: false, foreign_key: true|
## Association
- belongs_to :create_user

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
|create_user|reference|null: false, foreign_key: true|
|category|reference|null: false, foreign_key: true|
## Association
- belongs_to :create_user　dependent: :destroy
- belongs_to :category　dependent: :destroy
- has_many :comments　dependent: :destroy
- has_many :images　dependent: :destroy

# categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
## Association
- has_many :products

# commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text||
|create_user|reference|null: false, foreign_key: true|
|product|reference|null: false, foreign_key: true|
## Association
- belongs_to :create_user
- belongs_to :product

# creditcardsテーブル
|Column|Type|Options|
|------|----|-------|
|create_user|reference|null: false, foreign_key: true|
|customer|string|null: false|
|card|string|null: false|
## Association
- belongs_to :create_user

# imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|image|null: false|
|product|reference|null: false, foreign_key: true|
## Association
- belongs_to :product
