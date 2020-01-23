# frozen_string_literal: true

class Organization < ApplicationRecord
  after_create :create_tenant
  validates :name,:slug presence: true
  validates :slug uniqueness: true length: { maximum: 10 }
  def tenant_name
    slug.to_s
  end

  private

  def create_tenant
    Apartment::Tenant.create(tenant_name)
  end
end
