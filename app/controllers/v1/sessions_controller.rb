# frozen_string_literal: true

module V1
  class SessionsController < BaseController
    skip_before_action :authenticate!, only: :login

    def login
      @user = User.find_by_email(params[:login][:email])
      if @user&.authenticate(params[:login][:password])
        token = JsonWebToken.encode(user_id: @user.id, slug: (params[:login][:slug]))
        render_json("login success", token)
      else
        render_json(I18n.t("session.invalid"), :unauthorized)
      end
    end

    def login_params
      params.require(:login).permit(:email, :password, :slug)
    end
  end
end
