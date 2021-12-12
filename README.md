# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Assosiation

- has_many :orders
- has_many :items


## items テーブル

| Column              | Type       | Options                        |
| --------------------| ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| explanation         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| delivery_caharge_id | integer    | null: false                    |
| area_id             | integer    | null: false                    |
| derivery_date_id    | integer    | null: false                    |
| price               | integer    | null: false                    | 
| user                | references | null: false, foreign_key: true |

### Assosiation

- has_one :order
- belongs_to :user


## orders テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| item             | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

### Assosiation

- belongs_to :item
- belongs_to :user
- has_one :address


## addresses テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefectures_id   | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| order            | references | null:false, foreign_key: true  |

### Assosiation

- belongs_to :order


