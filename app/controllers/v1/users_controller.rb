# frozen_string_literal: true

module V1
  class UsersController < BaseController
    before_action :set_user, only: %i[show update destroy]
    before_action :invite_code, only: %i[create]

    def index
      @users = User.all
      render_json(message: I18n.t("success"), data: serializer(@users))
      # render_json(I18n.t("success"), serializer(@users))
    end

    def create
      if params[:user][:password] == params[:user][:confirm_password]
        @user = User.new(user_params)

        if @user.save
          render_json(message: I18n.t("create.success", model_name: "User"), data: serializer(@user))
        else
          render_json(message: I18n.t("create.failure", model_name: "User"), data: @user.errors.full_messages, status_code: :unprocessable_entity)
        end
      else
        render_json(message: I18n.t("create.failure", model_name: "User"), data: "Password not matches", status_code: :unprocessable_entity)
      end
    end

    def show
      render_json(message: I18n.t("success"), data: serializer(@user))
    end

    def update
      if @user.update(user_params)
        render_json(message: I18n.t("update.success", model_name: "User"), data: serializer(@user))
      else
        render_json(message: I18n.t("update.failure", model_name: "User"),  status_code: :unprocessable_entity)
      end
    end

    def destroy
      if @user.destroy
        render_json(message: I18n.t("destroy.success", model_name: "User"), data: serializer(@user))
      else
        render_json(message: I18n.t("destroy.failure", model_name: "User"), status_code: :unprocessable_entity)
      end
    end

    def set_user
      @user = User.find(params[:id])
    end

    def serializer(data)
      UserSerializer.new(data)
    end

    def invite_code
      unless params[:user][:invite_code] == "1234"
        
          render_json(message: I18n.t("create.failure", model_name: "User"), data: "Invite code is not match", status_code: :unprocessable_entity)
      end
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email_id, :contact_no, :password, :role_id, addresses_attributes: address_params)
    end

    def address_params
      %i[address_line_1 address_line_2 city state pin_code country id]
    end
  end
end
