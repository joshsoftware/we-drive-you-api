class AddInviteCodeToOrganization < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :invite_code, :string
  end
end
