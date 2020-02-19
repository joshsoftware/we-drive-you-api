# frozen_string_literal: true

module V1
  class UserSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :first_name, :last_name, :email_id, :contact_no, :role

    attributes :addresses do |object|
      V1::AddressSerializer.new(object.addresses)
    end
  end
end
