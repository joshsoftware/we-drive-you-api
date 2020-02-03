# frozen_string_literal: true

class Cab < ApplicationRecord
  has_many :rides
  validates :vehicle_no, :capacity, presence: true
  validates :vehicle_no, length: {in: 10..10}
  validates :capacity, numericality: {only_integer: true}
end
