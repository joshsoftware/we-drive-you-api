# frozen_string_literal: true

module V1
  class RideRequestsController < BaseController
    @rideid = ""
    def index
      id = params["ride_id"]
      @requests = RideRequest.where(ride_id: id)
    end

    def new
      @rideid = params["ride_id"]
    end

    def create
      puts "dsadasdas", params
      # obj = User.find_by(email: params["email"])
      # location = obj.destination
      # RideRequest.create(location: location, user_id: obj.id, ride_id: @@rideid)
      redirect_to rides_path
    end
  end
end
