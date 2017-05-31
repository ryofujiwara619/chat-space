
# DB設計

## messages table

| Column     | Type          | Option                                           |
|:-----------|:--------------|:------------------------------------------------:|
| id         | integer       | primary_key                                      |
| body       | text          | null:false                                       |
| image      | string        |                                                  |
| user_id    | reference     | index:true, null:false, foreign_key:true         |
| group_id   | reference     | index:true, null:false, foreign_key:true         |
| created_at | datetime      | default                                          |

### Association
belongs_to :user  
belongs_to :group


## users table

| Column     | Type          | Option                                           |
|:-----------|:--------------|:------------------------------------------------:|
| id         | integer       | primary_key                                      |
| name       | string        | null:false, unique:true                          |
| group_id   | reference     | index:true, null:false, foreign_key:true         |
| email      | string        | implemented by devise Gem                        |
| password   | string        | implemented by devise Gem                        |


### Association
has_many :messages  
has_many :groups, through: :groups_users  
has_many :groups_users

## groups table

| Column     | Type          | Option                                           |
|:-----------|:--------------|:------------------------------------------------:|
| id         | integer       | primary_key                                      |
| name       | string        | null:false, unique:true                          |


### Association
has_many :users, through: :groups_users  
has_many :messages  
has_many :groups_users


## groups_users table

| Column     | Type          | Option                                           |
|:-----------|:--------------|:------------------------------------------------:|
| id         | integer       | primary_key                                      |
| group_id   | reference     | index:true, null:false, foreign_key:true         |
| user_id    | reference     | index:true, null:false, foreign_key:true         |


### Association
belongs_to :user  
belongs_to :group



