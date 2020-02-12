# frozen_string_literal: true

module V1
  class RidesController < BaseController
    def index
      @rides = Ride.all
      render_json(serializer, @rides, "Ride details")
    end

    def new
      @ride = Ride.new
    end

    def show
      @ride = Ride.find_by(id: params[:id])
      render_json(serializer, @ride, "ride details")
    end

    def create
      @ride = Ride.new(ride_params)
      if @ride.save
        render_json(serializer, @ride, "Ride Created Successfully")
      else
        render json: {errors: @ride.errors.full_messages}, status: :unprocessable_entity
      end
    end

    def update
      @ride = Ride.find(params[:id])
      if @ride.update(ride_params)
        render_json(serializer, @ride, "Ride updated successfully")
      else
        render json: {errors: @ride.errors.full_messages}, status: :unprocessable_entity
      end
    end

    def destroy
      @ride = Ride.find(params[:id])
      @ride.destroy
      render_json(serializer, @ride, "Ride deleted successfully")
    end

    def ride_params
      params.require(:ride).permit(:time, :available_seats, :cab_id, hops_attributes: hops_params)
    end

    def hops_params
      %i[id location credit sequence_id ride_id]
    end

    def serializer
      RideSerializer
    end
  end
end
