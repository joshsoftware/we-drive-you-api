# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  api_version(module: "V1", header: {name: "Accept", value: "application/vnd.dds-api.com; version=1"}) do
  end
end
