# frozen_string_literal: true

module V1
  class OrganizationSignUpController < BaseController
    skip_before_action :authenticate!, only: %i[index create show update destroy]
    skip_before_action :validate_jwt_token!, only: %i[index create show update destroy]
    skip_before_action :switch_tenant!, only: %i[index create show update destroy]
    before_action :set_organization, only: %i[show update destroy]

    def index
      @organizations = Organization.all
      render_json(message: I18n.t("success"), data: @organizations)
    end

    def create
      if params[:organization][:password] == params[:organization][:confirm_password]
        @organization = Organization.new(organization_params)

        if @organization.save
          Apartment::Tenant.switch!(@organization.slug)
          @user = User.new(user_params)
          if @user.save
            @organization.addresses.create(address_params)
            @user_name = @user.first_name + " " + @user.last_name
            AdminMailer.send_signup_email(@user.email_id, @user_name).deliver_now
            render_json(
              message: "Registration Successful, Wait For Confirmation",
              data:    @organization
            )
          else
            render_json(
              message:     "Registration UnSuccessful",
              data:        @user.errors.full_messages,
              status_code: :unprocessable_entity
            )
          end
        else
          render_json(
            message:     "Registration UnSuccessful",
            data:        @organization.errors.full_messages,
            status_code: :unprocessable_entity
          )
        end
      else
        render_json(
          message:     I18n.t("create.failure",
                              model_name: "Organization"),
          data:        "Password Doesnot Match",
          status_code: :unprocessable_entity
        )
      end
    end

    def show
      render_json(
        message: "organization details",
        data:    @organization
      )
    end

    def update
      if @organization.update(organization_params)
        render_json(
          message: "organization updated successfully",
          data:    @organization
        )
      else
        render_json(
          message:     "fail to update organization",
          data:        @organization.errors.full_messages,
          status_code: :unprocessable_entity
        )
      end
    end

    def destroy
      @organization.destroy
      render_json(
        message: "organization is deleted",
        data:    @organization
      )
    end

    def set_organization
      @organization = Organization.find(params[:id])
    end

    def organization_params
      params.require(:organization).permit(:name, :slug)
    end

    def user_params
      params.require(:organization).permit(
        :first_name,
        :last_name,
        :email_id,
        :contact_no,
        :password,
        :role_id
      )
    end

    def address_params
      params.require(:organization).permit(
        :address_line_1,
        :address_line_2,
        :city,
        :state,
        :country,
        :pincode
      )
    end
  end
end
