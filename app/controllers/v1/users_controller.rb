# frozen_string_literal: true

module V1
  class UsersController < BaseController
    before_action :set_user, only: %i[show update destroy]

    def index
      @users = User.all
      render_json(serializer, @users, "User details")
    end

    def create
      if params[:user][:password] == params[:user][:confirm_password]
        @user = User.new(user_params)

        if @user.save
          render_json(serializer, @user, "User created successfully")
        else
          render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
        end
      else
        render json: {errors: "Password not matches"}, status: :unprocessable_entity
      end
    end

    def show
      render_json(serializer, @user, "user details")
    end

    def update
      render_json(serializer, @user, "User updated successfully") if @user.update(user_params)
    end

    def destroy
      @user.destroy
      render_json(serializer, @user, "User deleted successfully")
    end

    def set_user
      @user = User.find(params[:id])
    end

    def serializer
      UserSerializer
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email_id, :contact_no, :password, :role_id, addresses_attributes: address_params)
    end

    def address_params
      %i[address_line_1 address_line_2 city state pin_code country id]
    end
  end
end
