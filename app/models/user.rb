# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :addresses, as: :addressable, dependent: :destroy
  has_one :role
  accepts_nested_attributes_for :addresses

  validates :first_name, :last_name, :email_id, :contact_no, :password, presence: true
  # validates :email_id, uniqueness: true
  validates :contact_no, format: {with: /\A[1-9]{1}[0-9]{9}\z/}
  validates :email_id, format: {with: /\A[a-zA-Z0-9_.]+[@]{1}[a-zA-z]+[.]{1}[a-zA-Z]{2,4}+\z/}
  validates :password, length: {in: 4..10}
end
