class User < ApplicationRecord
  has_many :users_rewards
  has_many :rewards, through: :users_rewards

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_secure_password
end
