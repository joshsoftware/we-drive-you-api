# frozen_string_literal: true

class ApplicationController < ActionController::API
  def current_tenant
    Tenant.find_by_slug! request.slug
  end
end
