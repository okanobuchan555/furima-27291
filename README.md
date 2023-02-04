# FURIMA-27291 DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|username|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_day|date|null: false|
### Association
- has_many :items
- has_many :buyers

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item|string|null: false|
|content|text|null: false|
|category_id|integer|null: false|
|sales_status_id|integer|null: false|
|shipping_fee_status_id|integer|null: false|
|prefecture_id|string|null: false|
|scheduled_delivery_id|integer|null: false|
|price|integer|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_one :order

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string| |
|phone_number|string|null: false|
|order|references|null: false, foreign_key: true|
### Association
- belongs_to :order
