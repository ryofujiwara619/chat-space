
# DB設計

## messages table

| Column     | Type          | Option                                           |
|:-----------|--------------:|:------------------------------------------------:|
| id         | integer       | primary_key                                      |
| body       | text          | null:false                                       |
| image      | string        |                                                  |
| user_id    | reference     | index:true, null:false, foreign_key:true         |
| group_id   | reference     | index:true, null:false, foreign_key:true         |
| created_at | datetime      | default                                          |

### Association
belongs_to :user
belongs_to :group
