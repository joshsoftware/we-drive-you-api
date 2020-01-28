# frozen_string_literal: true

class Ride < ApplicationRecord
  belongs_to :cab
  validates :routes, :time, presence: true
end
