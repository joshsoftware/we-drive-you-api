# frozen_string_literal: true

module V1
  class SessionsController < BaseController
    skip_before_action :authenticate!, only: :login

    def login
      @user = User.find_by_email(params[:login][:email])
      if @user&.authenticate(params[:login][:password])
        token = JsonWebToken.encode(user_id: @user.id, slug: "hdfc")
        render_json("User Login Succesfully", auth_token: token)
      else
        render_json("Unauthorized User", "User is Not Present", :unauthorized)
      end
    end

    def decode_token
      puts(User.find(1))
      puts("current", current_user.inspect, current_tenant.inspect)
    end

    def login_params
      params.require(:login).permit(:email, :password)
    end
  end
end
