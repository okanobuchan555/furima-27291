# FURIMA-27291 DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|username|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|name1_1|string|null: false|
|name1_2|string|null: false|
|name2_1|string|null: false|
|name2_2|string|null: false|
|birthday|date|null: false|
### Association
- has_many :items
- has_many :buyers

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item|string|null: false|
|description|text|null: false|
|category_id|integer|null: false|
|condition_id|integer|null: false|
|charge_id|integer|null: false|
|area_of_origin_id|integer|null: false|
|number_of_days_id|integer|null: false|
|price|integer|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_one :buyer

## buyersテーブル
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
|area_of_origin_id|integer|null: false|
|city_town_village|string|null: false|
|address_line1|string|null: false|
|address_line2|string| |
|phone_number|string|null: false|
|buyer|references|null: false, foreign_key: true|
### Association
- belongs_to :buyer
