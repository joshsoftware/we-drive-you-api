# frozen_string_literal: true

class Ride < ApplicationRecord
  belongs_to :cab
  has_many :hops
  has_many :ride_requests
  validates :available_seats, :time, :cab_id, presence: true
  accepts_nested_attributes_for :hops, allow_destroy: true
  validates_associated :hops
end
