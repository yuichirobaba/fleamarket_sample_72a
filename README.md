# usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
## Association
- belongs_to :private_date
- belongs_to :product
- belongs_to :comment

# private_datasテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_namekana|string|null: false|
|first_namekana|string|null: false|
|birthday_year|string|null: false|
|birthday_month|string|null: false|
|birthday_day|string|null: false|
|zipcode|integer|null: false|
|gender|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|integer||
|phone|integer|null:false|
|user|reference|null: false, foreign_key: true|
## Association
- belomgs_to :user

# productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|comment|text|null: false|
|price|integer|null: false|
|image|image|null: false|
|brand|string||
|size|string||
## Association
belongs_to :user
belongs_to :comment
has_many :products_categorys
has_many :categorys, through: :products_categorys

# categorysテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
## Association
has_many :products_categorys
has_many :products, throught: :producs_categorys

# products_categorysテーブル
|Column|Type|Options|
|------|----|-------|
|product|reference|null: false, foreign_key: true|
|category|reference|null: false, foreign_key: true|
## Association
belongs_to :product
belongs_to :category

# commentssテーブル
|Column|Type|Options|
|------|----|-------|
|content|text||
|user|reference|null: false, foreign_key: true|
|product|reference|null: false, foreign_key: true|
## Association
belongs_to :user
belongs_to :product
