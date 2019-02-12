# README

## users テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|pasword|string|null:false|
|pasword_confirmation|string|null: false|

## Association
- has_many :lists, dependent: :destroy

## listsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null :false|
|user_id|reference|null: false, foregn_key: true|

## Association
- belongs_to :user
- has_many :card

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false, limit: 255|
|memo|string|limit: 1000|
|list_id|reference|null: false, foregn_key: true|

## Association
- belongs_to :list
= has_many :category

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|card_id|reference|null: false, foregn_key: true|

## Association
 -belongs_to :card

