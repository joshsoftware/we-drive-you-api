class ChangeVehicleColumnNameInCab < ActiveRecord::Migration[5.2]
  def change
    rename_column :cabs, :Vehicle_number, :vehicle_number
  end
end
