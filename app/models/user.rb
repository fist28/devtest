class User < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true

  has_one :statistic
end
