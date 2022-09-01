# FURIMA-27291 DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|username|string|null: false|
|email|string|unique: true|
|encrypted_password|string|null: false|
|encrypted_password(confirmation)|string|null: false|
|name1|string|null: false|
|name2|string|null: false|
|birthday|string|null: false|
### Association
- has_many :items
- has_many :buyers

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item|text|null: false|
|description|text|null: false|
|category_id|integer|null: false|
|condition|text|null: false|
|charge|text|null: false|
|area_of_origin|text|null: false|
|number_of_days|text|null: false|
|price|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_one :buyer

## buyersテーブル
|Column|Type|Options|
|------|----|-------|
|creditcard_number|text|null: false|
|effective_date|text|null: false|
|security_code|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|text|null: false|
|state_province_region|text|null: false|
|city_town_village|text|null: false|
|address_line1|text|null: false|
|address_line2|text|null: false|
|phone_number|text|null: false|
### Association
- belongs_to :buyer
