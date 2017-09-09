class UsersReward < ApplicationRecord
  belongs_to :user
  belongs_to :rewards
end
