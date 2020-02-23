# frozen_string_literal: true

module V1
  class RidesController < BaseController
    before_action :set_ride, only: %i[show update destroy]
    skip_before_action :validate_jwt_token!, only: :create
    skip_before_action :authenticate!, only: :create

    def index
      @ride = Ride.all
      render_json(message: I18n.t("success"), data: serializer(@ride))
    end

    def create
      @ride = Ride.new(ride_params)
      if @ride.save
        render_json(message: I18n.t("create.success", model_name: "Ride"), data: serializer(@ride))
      else
        render_json(message: I18n.t("create.failure", model_name: "Ride"), data: @ride.errors.full_messages, status_code: :unprocessable_entity)
      end
    end

    def show
      render_json(message: I18n.t("success"), data: serializer(@ride))
    end

    def update
      if @ride.update(ride_params)
        render_json(message: I18n.t("update.success", model_name: "Ride"), data: serializer(@ride))
      else
        render_json(message: I18n.t("update.failure", model_name: "Ride"),  status_code: :unprocessable_entity)
      end
    end

    def destroy
      if @ride.destroy
        render_json(message: I18n.t("destroy.success", model_name: "Ride"), data: serializer(@ride))
      else
        render_json(message: I18n.t("destroy.failure", model_name: "Ride"), status_code: :unprocessable_entity)
      end
    end

    def set_ride
      @ride = Ride.find(params[:id])
      render_json(message: I18n.t("invalid")) unless @ride.id == params[:id].to_i
    end

    def serializer(data)
      RideSerializer.new(data)
    end

    def ride_params
      puts(params[:ride])
      params.require(:ride).permit(:time, :available_seats, :cab_id, hops_attributes: hops_params)
    end

    def hops_params
      %i[id location credit sequence_id ride_id]
    end
  end
end
