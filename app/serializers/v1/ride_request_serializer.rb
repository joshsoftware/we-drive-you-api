# frozen_string_literal: true

module V1
  class RideRequestSerializer
    include FastJsonapi::ObjectSerializer
		attributes :id, :hop_id, :user_id
    # attributes :hop do |object|
    #   V1::CabSerializer.new(object.hop.ride)
    # end
    
    # belongs_to :ride
  end
end