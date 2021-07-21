# README

# テーブル設計

## users テーブル -----------------------------------------

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------      |
| nick_name          | string | null: false               |
| email              | string | null: false ,unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | string | null: false               |


### Association

- has_many : items
- has_many : orders

## items テーブル -----------------------------------------

| Column       | Type       | Options            |
| ---------    | ---------- | -----------        |
| item_name    | string     | null: false        |
| description  | text       | null: false        |
| category_id  | integer    | null: false        |
| status_id    | integer    | null: false        |
| charges_id   | integer    | null: false        |
| area_id      | integer    | null: false        |
| days_id      | integer    | null: false        |
| price        | integer     | null: false       |
| user         | references | foreign_key: true  |

### Association

- belongs_to :user
- has_one  :order

## orders テーブル -----------------------------------------

| Column             | Type       | Options            |
| ------------------ | ---------- | -----------        |
| user               | references | foreign_key: true  |
| item               | references | foreign_key: true  |


### Association

- belongs_to :user
- belongs_to :item
- has_one  :residences

## residencesテーブル -----------------------------------------

| Column             | Type       | Options            |
| ------------------ | ---------- | ------------------ |
| prefecture         | string     | null: false        |
| prefecture         | string     | null: false        |
| municipality       | string     | null: false        |
| address            | string     | null: false        |
| phone_number       | string     | null: false        |
| building_name      | string     |                    |
| order              | references | foreign_key: true  |

### Association

- belongs_to :order
