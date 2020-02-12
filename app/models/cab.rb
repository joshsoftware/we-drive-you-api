# frozen_string_literal: true

class Cab < ApplicationRecord
  has_many :rides
  validates :vehicle_number, :capacity, presence: true
  validates :vehicle_number, length: {in: 10..10}
  validates :capacity, numericality: {only_integer: true}
end
