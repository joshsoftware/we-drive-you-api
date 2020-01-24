class AddColumnsToOrganization < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :email, :string
    add_column :organizations, :password, :string
    add_column :organizations, :contact_no, :string
  end
end
