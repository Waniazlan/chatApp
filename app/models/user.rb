class User < ApplicationRecord
    validates_uniqueness_of :username
  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to "users" }
  has_many :messages
  has_and_belongs_to_many :users
end
