# frozen_string_literal: true

module V1
  class BaseController < ApplicationController
    before_action :validate_jwt_token!
    before_action :switch_tenant!
    before_action :authenticate!

    attr_reader :current_tenant, :current_user

    def render_json(message:, data: {}, status_code: :ok)
      render json: {message: message, data: data}, status: status_code
    end

    def authenticate!
      load_current_user!
      invalid_authentication unless @current_user
    end

    def validate_jwt_token!
      if request.headers["Authorization"].present?
        token = request.headers["Authorization"]
        @payload = JsonWebToken.decode(token)
        return token_invalid unless JsonWebToken.valid_payload(@payload)
      else
        render_json(message: I18n.t("session.invalid"), status_code: :unauthorized)
      end
    end

    def token_invalid
      render_json(message: I18n.t("session.expired"), status_code: :unauthorized)
    end

    def switch_tenant!
      byebug
      if request.subdomain.present?
        slug = request.subdomain
        @current_tenant = Organization.find_by(slug: slug)
        unless @current_tenant
          render_json(message: I18n.t("session.tenant_not_found"), status_code:
            :unauthorized)
        end
        Apartment::Tenant.switch!(@current_tenant.slug)
      else
        render_json(message: "subdomain is not present")
      end
    end

    def invalid_authentication
      render_json(message: I18n.t("session.invalid"), status_code: :unauthorized)
    end

    def load_current_user!
      @current_user = User.find_by(id: @payload["user_id"])
    end
  end
end 
