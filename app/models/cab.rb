# frozen_string_literal: true

class Cab < ApplicationRecord
  belongs_to :driver
  has_many :rides
  validates :Vehicle_number, :cab_capacity, presence: true
  validates :Vehicle_number, length: {in: 10..10}
  validates :cab_capacity, numericality: {only_integer: true}
end
