class AddApprovalStatusToOrganization < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :is_approved, :boolean, :default => false
  end
end
