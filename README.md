# テーブル設計


## usersテーブル
|    column                       |  type  |    options  |
| ------------------------------- | ------ | ----------- |
| name                            | string | null: false |
| email                           | string | null: false |
| encrypted_password              | string | null: false |
| last_name                       | string | null: false |
| first_name                      | string | null: false |
| last_name_kana                  | string | null: false |
| first_name_kana                 | string | null: false |
| birth_date                      | date   | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :orders


## itemsテーブル
|    column             |  type   |   options   |
| --------------------- | ------  | ----------- |
| product               | string  | null: false |
| exception             | text    | null: false |
| category_id           | integer | null: false |
| condition_id          | integer | null: false |
| payer_id              | integer | null: false |
| location_id           | integer | null: false |
| send_day_id           | integer | null: false |
| price                 | integer | null: false |
| user                  |references|null: false, foreign_key: true|

### Association
- has_many :comments
- belongs_to :user
- has_one :trade


## commentsテーブル
|    column             |  type  |   options   |
| --------------------- | ------ | ----------- |
| text                  | text   | null: false |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item


## ordersテーブル
|    column             |  type   |   options   |
| --------------------- | ------- | ----------- |
| post                  | string  | null: false |
| prefecture_id         | integer | null: false |
| city                  | string  | null: false |
| address               | string  | null: false |
| property              | string  |             |
| tel                   | string  | null: false |
| trade                 |references|null: false, foreign_key: true|

### Association
- belongs_to :trade


## tradesテーブル
|    column             |  type    |   options       |
| --------------------- | -------  | --------------- |
| user                  |references|null: false, foreign_key: true|
| item                  |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :order



