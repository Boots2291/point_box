class Reward < ApplicationRecord
  has_many :users_rewards
  has_many :users, through: :users_rewards

  validates :name, presence: true, uniqueness: true
  validates :cost, presence: true
end
