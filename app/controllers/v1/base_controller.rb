# frozen_string_literal: true

module V1
  class BaseController < ApplicationController
    before_action :authenticate!

    attr_reader :current_tenant

    def authenticate!
      return invalid_authentication if !payload || !JsonWebToken.valid_payload(payload.first)

      load_current_user!
      invalid_authentication unless @current_user
    end

    def payload
      if request.headers["Authorization"].present?
        token = request.headers["Authorization"]
        JsonWebToken.decode(token)
      else
        render json: {message: "invalid user"}, status: :unauthorized
      end
    end

    def invalid_authentication
      render json: {error: "Invalid Request"}, status: :unauthorized
    end

    def load_current_user!
      @current_user = User.find_by(id: payload["user_id"])
    end
  end
end
