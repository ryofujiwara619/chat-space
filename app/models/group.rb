class Group < ApplicationRecord
  validates :name,presence:true,uniqueness: true
  has_many :users, through: :groups_users
  has_many :messages
  has_many :groups_users
end
