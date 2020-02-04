# frozen_string_literal: true

module V1
  class UsersController < BaseController

    def index
      @users = User.all
      render json: @users
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        #render json: @user, status: :created
        render json: {message: 'User created successfully', data: @user}, status: :created
      else
        #byebug
        render json:   {errors: @user.errors.full_messages},
               status: :unprocessable_entity
      end
    end

    def show
      @user = User.find(params[:id])
      render json: {message: 'User details', data: @user}, status: :ok
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        render json: {message: 'User updated successfully', data: @user}, status: :ok
      else
        render json:   {errors: @user.errors.full_messages},
               status: :unprocessable_entity
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      render json: {message: 'User is deleted', data: @user}, status: :ok
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.permit(:first_name, :last_name, :email_id, :contact_no, :password, :role_id)
    end
  end
end
