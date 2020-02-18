# frozen_string_literal: true

module V1
  class OrganizationSignUpController < BaseController
    skip_before_action :authenticate!, only: %i[index create show update destroy]
    skip_before_action :validate_jwt_token!, only: %i[index create show update destroy]
    skip_before_action :switch_tenant!, only: %i[index create show update destroy]
    before_action :set_organization, only: %i[show update destroy]

    def index
      @organizations = Organization.all
      render_json(message: "All organization details", data: @organizations)
    end

    def create
      @organization = Organization.new(organization_params)
      if @organization.save
        render_json(message: "organization created successfully", data: @organization)
      else
        render_json(message: "fail to create organization", data: @organization.errors.full_messages, status: :unprocessable_entity)
      end
    end

    def show
      render_json(message: "organization details", data: @organization)
    end

    def update
      if @organization.update(organization_params)
        render_json(message: "organization updated successfully", data: @organization)
      else
        render_json(message: "fail to update organization", data: @organization.errors.full_messages, status: :unprocessable_entity)
      end
    end

    def destroy
      @organization.destroy
      render_json(message: "organization is deleted", data: @organization)
    end

    def set_organization
      @organization = Organization.find(params[:id])
    end

    def organization_params
      params.require(:organization).permit(:name, :slug)
    end
  end
end
