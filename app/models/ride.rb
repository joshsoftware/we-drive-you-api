# frozen_string_literal: true

class Ride < ApplicationRecord
  belongs_to :cab
  has_many :ride_requests
  validates :routes, :time, presence: true
end
