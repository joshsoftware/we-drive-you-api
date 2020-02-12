# frozen_string_literal: true

module V1
  class HopSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :location, :credit, :sequence_id
    # belongs_to :ride
  end
end
