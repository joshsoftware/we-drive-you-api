# frozen_string_literal: true

module V1
  class SessionsController < BaseController
    skip_before_action :authenticate!, only: :login
    skip_before_action :validate_jwt_token!, only: :login
    before_action :validate_params, only: :login

    def login
      @user = User.find_by_email_id(login_params[:email_id])
      if @user&.authenticate(login_params[:password])
        token = JsonWebToken.encode(user_id: @user.id)
        render_json(message:     "User Login Succesfully",
                    data:        {auth_token: token, slug: current_tenant.slug},
                    status_code: :ok)
      else
        render_json(
          message:     "Unauthorized Useremail",
          status_code: :unauthorized
        )
      end
    end

    def validate_params
      sign_in_params = params[:login][:email_id].present? &&
                       params[:login][:password].present?
      # params[:login][:slug].present?
      return render_json(message: "Insufficient Data", status_code: :unauthorized) unless sign_in_params
    end

    def login_params
      params.require(:login).permit(
        :email_id,
        :password,
        :slug
      )
    end
  end
end
