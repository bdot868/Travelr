class User < ApplicationRecord
  has_secure_password
  has_many :posts
  accepts_nested_attributes_for :posts, allow_destroy: true
end
