class CreateCabs < ActiveRecord::Migration[5.2]
  def change
    create_table :cabs do |t|
      t.integer :capacity
      t.string :vehicle_no

      t.timestamps
    end
  end
end
