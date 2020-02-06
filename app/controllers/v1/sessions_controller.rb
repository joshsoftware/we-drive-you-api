# frozen_string_literal: true

module V1
  class SessionsController < BaseController
    def login
      @user = User.find_by_email(params[:login][:email])
      if @user&.authenticate(params[:login][:password])
        token = JsonWebToken.encode(user_id: @user.id, slug: "josh")
        render json: {message: "User Login Succesfully", data: {auth_token: token}}, status: :ok
      else
        render json: {error: "unauthorized User"}, status: :unauthorized
      end
    end

    private

    def login_params
      params.require(:login).permit(:email, :password)
    end
  end
end
