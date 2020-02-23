# frozen_string_literal: true

class Cab < ApplicationRecord
  has_many :rides
  validates :vehicle_number, :capacity, :min_passengers, presence: true
  validates :vehicle_number, uniqueness: true, on: :create
  validates :min_passengers, :capacity, numericality: {only_integer: true, greater_than: 0}
  validates :min_passengers, numericality: {less_than_or_equal_to: :capacity}
  # belongs_to :organization
end
