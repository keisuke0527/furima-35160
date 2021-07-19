# README

# テーブル設計

## users テーブル -----------------------------------------

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nick_name          | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| name               | string | null: false |
| name_kana          | string | null: false |
| birthday           | string | null: false |


### Association

- has_many : items
- has_many : orders

## items テーブル -----------------------------------------

| Column       | Type       | Options            |
| ---------    | ---------- | -----------        |
| image        |            |                    |
| item_name    | string     | null: false        |
| description  | string     | null: false        |
| category     | string     | null: false        |
| status       | string     | null: false        |
| charges      | string     | null: false        |
| area         | string     | null: false        |
| days         | string     | null: false        |
| price        | string     | null: false        |
| user_id      | references | foreign_key: true  |

### Association

- belongs_to :user
- has_one  :order

## order テーブル -----------------------------------------

| Column                | Type       | Options            |
| ------------------    | ---------- | -----------        |
| user_id               | references | foreign_key: true  |
| item_id               | references | foreign_key: true  |


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
| user_id            | references | foreign_key: true  |
| item_id            | references | foreign_key: true  |
| order_id            | references | foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :order