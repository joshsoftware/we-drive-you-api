# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ::ActionController::Serialization
  def current_tenant
    Tenant.find_by_slug! request.slug
  end
end
