# README

# テーブル設計

## users テーブル -----------------------------------------

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nick_name          | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| name_kana          | string | null: false |
| birthday           | string | null: false |


### Association

- has_many : items
- has_many : orders

## items テーブル -----------------------------------------

| Column       | Type       | Options            |
| ---------    | ---------- | -----------        |
| item_name    | string     | null: false        |
| description  | string     | null: false        |
| item_id      | integer    | null: false        |
| item_id      | integer    | null: false        |
| item_id      | integer    | null: false        |
| item_id      | integer    | null: false        |
| item_id      | integer    | null: false        |
| price        | string     | null: false        |
| user         | references | foreign_key: true  |

### Association

- belongs_to :user
- has_one  :order

## order テーブル -----------------------------------------

| Column             | Type       | Options            |
| ------------------ | ---------- | -----------        |
| user               | references | foreign_key: true  |
| item               | references | foreign_key: true  |


### Association

- belongs_to :user
- belongs_to :item

## residencesテーブル -----------------------------------------

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postal_code        | string     | null: false        |
| prefecture         | string     | null: false        |
| municipality       | string     | null: false        |
| address            | string     | null: false        |
| phone_number       | string     | null: false        |
| building_name      | string     |                    |
| user               | references | foreign_key: true  |
| item               | references | foreign_key: true  |
| order              | references | foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :order