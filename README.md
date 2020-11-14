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
| send_days_id          | integer | null: false |
| price                 | integer | null: false |

### Association
- has_many :comments
- belongs_to :user
- has_one :order

## commentsテーブル
|    column             |  type  |   options   |
| --------------------- | ------ | ----------- |
| text                  | text   | null: false |

### Association
- belongs_to :user
- belongs_to :item

## orderテーブル
|    column             |  type   |   options   |
| --------------------- | ------- | ----------- |
| post                  | string  | null: false |
| prefecture_id         | integer | null: false |
| city                  | string  | null: false |
| address               | string  | null: false |
| property              | string  |             |
| tel                   | string  | null: false |
| trade                 |reference|             |


### Association
- has_one :item
- belongs_to :user
- belongs_to :trade

## tradeテーブル
|    column             |  type   |   options   |
| --------------------- | ------- | ----------- |
| chat                  | text    | null: false |
| user                  |reference|             |
| item                  |reference|             |

### Association
- belongs_to :user
- belongs_to :item
- has_one :order



