class User < ApplicationRecord
  has_many :addresses, as: :addressable
  has_one :role
end
