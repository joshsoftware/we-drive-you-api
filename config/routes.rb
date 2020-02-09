class SubdomainConstraint
  def self.matches?(request)
    request.subdomain.present? && request.subdomain != "www"
  end
end

# frozen_string_literal: true
Rails.application.routes.draw do
  api_version(module: "V1", header: {name: "Accept", value: "application/cab-tab.com; version=1"}) do
    resources :users

    constraints SubdomainConstraint do
      resources :organizations
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
