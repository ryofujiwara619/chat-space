
# DB設計

## messages table

| Column     | Type        | Option             |
|:-----------|------------:|:------------:      |
| id         | integer     | null:false         |
| body       | text        | null:false         |
| image      | string      |                    |
| user_id    | integer     | null:false         |
| group_id   | integer     | null:false         |
| created_at | integer     | null:false         |

## Association
belongs_to :user
belongs_to :group
