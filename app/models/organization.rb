# frozen_string_literal: true

class Organization < ApplicationRecord
  after_create :create_tenant

  def tenant_name
    slug.to_s
  end

  private

  def create_tenant
    Apartment::Tenant.create(tenant_name)
  end
end
