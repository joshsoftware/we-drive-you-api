# frozen_string_literal: true

module V1
  class RidesController < BaseController
    def index
      @rides = Ride.all
      render json: @rides
    end

    def new
      @ride = Ride.new
    end

    def create
      @ried = Ride.new(ride_params)
      if @ride.save
        render json: {message: "Ride created successfully", data: @ride}, status: :created
      else
        render json:   {errors: @ride.errors.full_messages},
               status: :unprocessable_entity
      end
    end

    def show
      @ride = Ride.find(params[:id])
      render json: {message: "Ride details", data: @ride}, status: :ok
    end

    def update
      @ride = Ride.find(params[:id])
      if @ride.update(ride_params)
        render json: {message: "Ride updated successfully", data: @ride}, status: :ok
      else
        render json:   {errors: @ride.errors.full_messages},
               status: :unprocessable_entity
      end
    end

    def destroy
      @ride = Ride.find(params[:id])
      @ride.destroy
      render json: {message: "Ride is deleted", data: @ride}, status: :ok
    end

    def ride_params
      params.permit(:time, :routes, :available_seats, :cab_id)
    end
  end
end
