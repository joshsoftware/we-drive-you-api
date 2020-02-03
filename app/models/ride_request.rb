# frozen_string_literal: true

class RideRequest < ApplicationRecord
  belongs_to :ride
  belongs_to :user
  validates :location, presence: true
end
