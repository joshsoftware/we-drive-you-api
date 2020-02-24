# frozen_string_literal: true

class Hop < ApplicationRecord
  belongs_to :ride
  has_many :ride_requests
end
