# frozen_string_literal: true

module V1
  class AddressSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :address_line_1, :address_line_2, :city, :state, :country, :pin_code
  end
end
