class RenamePincodeInAddress < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :pin_code, :pincode
  end
end
