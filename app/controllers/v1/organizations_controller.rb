# frozen_string_literal: true

module V1
  class OrganizationsController < BaseController
    before_action :set_organization, only: %i[show update destroy]

    def index
      @organizations = Organization.all
      render_json("All organization details", @organizations)
    end

    def create
      @organization = Organization.new(organization_params)
      if @organization.save
        render_json("organization created successfully", @organization)
      else
        render_json("fail to create organization", @organization.errors.full_messages, :unprocessable_entity)
      end
    end

    def show
      render_json("organization details", @organization)
    end

    def update
      if @organization.update(organization_params)
        render_json("organization updated successfully", @organization)
      else
        render_json("fail to update organization", @organization.errors.full_messages, :unprocessable_entity)
      end
    end

    def destroy
      @organization.destroy
      render_json("organization is deleted", @organization)
    end

    def set_organization
       unless @organization = Organization.find_by(id: params[:id])
        render_json("Error", "Could not find Organization with id=#{params[:id]}")
      end
    end

    def organization_params
      params.require(:organization).permit(:name, :slug)
    end
  end
end
