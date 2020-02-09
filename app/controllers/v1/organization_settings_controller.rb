module V1
class OrganizationSettingsController < BaseController
   before_action :set_organizationSetting, only: %i[show update destroy]

    def index
      @organizationSettings = OrganizationSetting.all
      render_json("All OrganizationSetting details", @organizationSettings)
    end

    def create
      @organizationSetting = OrganizationSetting.new(organizationSetting_params)
      if @organizationSetting.save
        render_json("OrganizationSetting created successfully", @organizationSetting)
      else
        render_json("fail to create OrganizationSetting", @organizationSetting.errors.full_messages, :unprocessable_entity)
      end
    end

    def show
      render_json("OrganizationSetting details", @organizationSetting)
    end

    def update
      if @organizationSetting.update(organizationSetting_params)
        render_json("OrganizationSetting updated successfully", @organizationSetting)
      else
        render_json("fail to update OrganizationSetting", @organizationSetting.errors.full_messages, :unprocessable_entity)
      end
    end

    def destroy
      @organizationSetting.destroy
      render_json("OrganizationSetting is deleted", @organizationSetting)
    end

    def set_organizationSetting
      unless @organizationSetting = OrganizationSetting.find_by(id: params[:id])
        render_json("Error", "Could not find Organization Settings with id=#{params[:id]}")
      end
    end

    def organizationSetting_params
      params.require(:organizationSetting).permit(:cost_of_one_credit, :yeild_per_week, :service_type, :organization_id)
    end
end
end
