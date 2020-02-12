# frozen_string_literal: true

module V1
  class BaseController < ApplicationController
    def render_json(serializer, data, message, _status_code=:ok)
      serialize_resource(message, serializer, data)
    end

    def serialize_resource(message, serializer, data)
      render json: {message: message, data: serializer.new(data)}
    end
  end
end
