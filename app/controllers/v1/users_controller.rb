# frozen_string_literal: true

module V1
  class UsersController < BaseController
    before_action :set_user, only: %i[show update destroy]

    def index
      @users = User.all
      render json: @users, each_serializer: V1::UserSerializer
      # render_json("All User details", @users)
    end

    def create
      if params[:user][:password] == params[:user][:confirm_password]
        @user = User.new(user_params)
        if @user.save
          render_json("User created successfully", @user)
        else
          render_json("fail to create user", @user.errors.full_messages, :unprocessable_entity)
        end
      else
        render_json("fail to create user", "Password not matches", :unprocessable_entity)
      end
    end

    def show
      render json: @user, serializer: V1::UserSerializer
      # render_json("User details", @user, V1::UserSerializer)
    end

    def update
      if @user.update(user_params)
        @user.addresses.update(user_params)
        render_json("User updated successfully", @user)
      else
        render_json("fail to update user", @user.errors.full_messages, :unprocessable_entity)
      end
    end

    def destroy
      @user.destroy
      @user.addresses.destroy
      render_json("User is deleted", @user)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email_id, :contact_no, :password, :role_id, addresses_attributes: address_params)
    end

    def address_params
      %i[address_line_1 address_line_2 city state pin_code country]
    end
  end
end
