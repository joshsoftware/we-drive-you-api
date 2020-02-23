# frozen_string_literal: true

module V1
  class RideSerializer
    include FastJsonapi::ObjectSerializer
    attributes :available_seats, :time, :cab_id
    attributes :hops do |object|
      V1::HopSerializer.new(object.hops)
    end
    attributes :cab do |object|
      V1::CabSerializer.new(object.cab)
    end
  end
end
