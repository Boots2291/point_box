class Reward < ApplicationRecord
  has_and_belongs_to_many :users

  validates :name, presence: true, uniqueness: true
  validates :cost, presence: true
end
