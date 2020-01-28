class RemoveCabIdFromCab < ActiveRecord::Migration[5.2]
  def change
    remove_column :cabs, :cab_id
  end
end
