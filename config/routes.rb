class SubdomainConstraint
  def self.matches?(request)
    request.subdomain.present? && request.subdomain != "www"
  end
end

# frozen_string_literal: true
Rails.application.routes.draw do
  api_version(module: "V1", header: {name: "Accept", value: "application/vnd.cab-tab.com; version=1"}) do
    resources :rides
    # get '/rides', to: 'rides#index'
    constraints SubdomainConstraint do
      resources :organizations
    end
  end
end
