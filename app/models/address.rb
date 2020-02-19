# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  validates :address_line_1, :address_line_2, :city, :state, :pincode, :country, presence: true
end
