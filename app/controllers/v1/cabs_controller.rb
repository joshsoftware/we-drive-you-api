# frozen_string_literal: true

module V1
  class CabsController < BaseController
    before_action :set_cab, only: %i[show update destroy]
 
    def index
      @cabs = Cab.all
      render_json(message: I18n.t("success"), data: serializer(@cabs))
    end
 
    def create 
      @cab = Cab.create(cab_params)
      if @cab.save
        render_json(message: I18n.t("create.success", model_name: "Cab"), data: serializer(@cab), status_code: :created)
      else
        render_json(message: I18n.t("create.failure", model_name: "Cab"), data: @cab.errors.full_messages, status_code: :unprocessable_entity)
      end  
    end
 
    def show
      render_json(message: I18n.t("success"), data: serializer(@cab), status_code: :created)
    end
 
    def update
      if @cab.update(cab_params)
        render_json(message: I18n.t("update.success", model_name: "Cab"), data: serializer(@cab))
      else
        render_json(message: I18n.t("update.failure", model_name: "Cab"),  status_code: :unprocessable_entity)
      end
    end
 
    def destroy

      if @cab.destroy
        render_json(message: I18n.t("destroy.success", model_name: "Cab"), data: serializer(@cab))
      else
        render_json(message: I18n.t("destroy.failure", model_name: "Cab"), status_code: :unprocessable_entity)
      end
    end
 
    def set_cab
      @cab = Cab.find(params[:id])
    end
 
    def serializer(data)
      CabSerializer.new(data)
    end
 
    def cab_params
      params.require(:cab).permit(:vehicle_number, :capacity, :min_passengers)
    end
 
  end
 end
