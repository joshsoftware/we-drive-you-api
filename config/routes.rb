class SubdomainConstraint
  def self.matches?(request)
    request.subdomain.present? && request.subdomain != "www"
  end
end

# frozen_string_literal: true
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  api_version(module: "V1", header: {name: "Accept", value: "application/vnd.dds-api.com; version=1"}) do
    constraints SubdomainConstraint do
      resources :organizations
    end
  end
end
