class User < ApplicationRecord

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_secure_password

  # helper_method :add_point
  #
  # def add_point
  #   self.points += 1
  # end

end
