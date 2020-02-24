# frozen_string_literal: true

module V1
  class RideRequestController < BaseController
    before_action :set_ride, only: %i[show update destroy]
    skip_before_action :validate_jwt_token!, only: :create
    skip_before_action :authenticate!, only: :create

    def index
      @ride_request = RideRequest.all
      render_json(message: I18n.t("success"), data: serializer(@ride_request))
    end

    def create
      @ride_request = RideRequest.new(ride_request_params)
      if @ride_request.save
        @ride = @ride_request.hop.ride
        @available_seats = @ride_request.hop.ride.available_seats - 1
        @ride.update(available_seats: @available_seats)
        render_json(message: I18n.t("create.success", model_name: "Ride Request"), data: serializer(@ride_request))
      else
        render_json(message: I18n.t("create.failure", model_name: "Ride Request"), data: @ride_request.errors.full_messages, status_code: :unprocessable_entity)
      end
    end

    def show
      @rides = RideRequest.where(user_id: @current_user.id) 
      render_json(message: I18n.t("success"), data: serializer(@rides))
    end

    def update
      if @ride_request.update(ride_params)
        render_json(message: I18n.t("update.success", model_name: "Ride Request"), data: serializer(@ride_request))
      else
        render_json(message: I18n.t("update.failure", model_name: "Ride Request"),  status_code: :unprocessable_entity)
      end
    end

    def destroy
      if @ride_request.destroy
        render_json(message: I18n.t("destroy.success", model_name: "Ride Request"), data: serializer(@ride_request))
      else
        render_json(message: I18n.t("destroy.failure", model_name: "Ride Request"), status_code: :unprocessable_entity)
      end
    end

    def serializer(data)
      RideRequestSerializer.new(data)
    end

    def set_ride
      @ride_request = RideRequest.find(params[:id])
      render_json(message: I18n.t("invalid")) unless @ride_request.id == params[:id].to_i
    end

    def ride_request_params
      params.require(:ride_request).permit(:hop_id, :user_id)
    end
  end
end
