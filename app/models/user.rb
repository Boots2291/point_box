class User < ApplicationRecord
  has_and_belongs_to_many :rewards

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_secure_password
end
