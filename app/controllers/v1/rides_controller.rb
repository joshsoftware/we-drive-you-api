# frozen_string_literal: true

module V1
  class RidesController < BaseController
    def index
      render json: Ride.all.as_json
    end
  end
end
