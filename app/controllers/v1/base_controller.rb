# frozen_string_literal: true

module V1
  class BaseController < ApplicationController
    def render_json(message:, data: {}, status_code: :ok)
      render json: {message: message, data: data, status: status_code}
    end
  end
end