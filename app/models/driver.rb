# frozen_string_literal: true

class Driver < ApplicationRecord
  has_one :cab
  validates :first_name, :last_name, :mobile_number, :licence_number, presence: true
  validates :mobile_number, uniqueness: true, length: {in: 10..10}, numericality: {only_integer: true}
  validates :licence_number, length: {in: 15..15}
  before_save do
    self.first_name = first_name.titleize
    self.last_name = last_name.titleize
  end
end
