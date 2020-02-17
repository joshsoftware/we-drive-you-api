class RenameColumnFromAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :street, :address_line_1
    rename_column :addresses, :landmark, :address_line_2
  end
end
