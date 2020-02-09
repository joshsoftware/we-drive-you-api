class CreateOrganizationSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_settings do |t|
      t.string :cost_of_one_credit
      t.string :yeild_per_week
      t.string :service_type
      
      t.references :organization
      t.timestamps
    end
  end
end
