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
- belongs_to :order


## itemsテーブル
|    column             |  type   |   options   |
| --------------------- | ------  | ----------- |
| product               | string  | null: false |
| exception             | text    | null: false |
| category_id           | integer | null: false |
| condition_id          | integer | null: false |
| payer_id              | integer | null: false |
| location_id           | integer | null: false |
| send_days_id          | date    | null: false |
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
| prefecture            | integer | null: false |
| city                  | string  | null: false |
| address               | string  | null: false |
| property              | date    | null: false |
| tel                   | string  | null: false |

### Association
- has_one :item
- belongs_to :user


