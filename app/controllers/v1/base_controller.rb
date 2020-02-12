# frozen_string_literal: true

module V1
  class BaseController < ApplicationController
    def render_json(serializer, data, message, _status_code=:ok, options={})
      serialize_resource(message, serializer, data, options)
    end

    def serialize_resource(message, serializer, data, options)
      render json: {message: message, data: serializer.new(data, options)}
    end
  end
end
