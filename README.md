# テーブル設計


## usersテーブル
|    column             |  type  |    options  |
| ------------          | ------ | ----------- |
| name                  | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| last_name_kana        | string | null: false |
| first_name_kana       | string | null: false |
| birth_date            | date   | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :order


## itemsテーブル
|    column             |  type  |   options   |
| ------------          | ------ | ----------- |
| product               | string | null: false |
| image                 |        | null: false |
| exception             | string | null: false |
| category              | string | null: false |
| condition             | string | null: false |
| payer                 | string | null: false |
| location              | string | null: false |
| send_days             | date   | null: false |
| price                 | number | null: false |

### Association
- has_many :comments
- belongs_to :user
- has_many :orders


## commentsテーブル
|    column             |  type  |   options   |
| ------------          | ------ | ----------- |
| text                  | string | null: false |
| image                 |        | null: false |
| exception             | string | null: false |

### Association
- belongs_to :user
- belongs_to :item

## orderテーブル
|    column             |  type  |   options   |
| ------------          | ------ | ----------- |
| card_num              | string | null: false |
| expiration            |        | null: false |
| key_code              | string | null: false |
| post                  | string | null: false |
| prefecture            | string | null: false |
| city                  | string | null: false |
| address               | string | null: false |
| property              | date   | null: false |
| tel                   | number | null: false |

### Association
- belongs_to :item
- belongs_to :user


