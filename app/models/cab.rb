# frozen_string_literal: true

class Cab < ApplicationRecord
  has_many :rides
  validates :vehicle_number, :cab_capacity, presence: true
  validates :vehicle_number, length: {in: 10..10}
  validates :cab_capacity, numericality: {only_integer: true}
end
