class UpdateAttributeNamesInAddress < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :landmark, :address_line_1
    rename_column :addresses, :street, :address_line_2
  end
end
