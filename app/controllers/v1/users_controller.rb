# frozen_string_literal: true

module V1
  class UsersController < V1::BaseController
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
        render json: @user, status: :created
      else
        render json:   {errors: @user.errors.full_messages},
               status: :unprocessable_entity
      end
    end

    # def edit
    #    @user = User.find(params[:id])
    # end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        render json: @user, status: :updated
      else
        render json:   {errors: @user.errors.full_messages},
               status: :unprocessable_entity
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      render json: @user, status: :deleted
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.permit(:first_name, :last_name, :email_id, :contact_no, :password)
    end
  end
end
