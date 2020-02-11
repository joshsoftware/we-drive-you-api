class CreateCabs < ActiveRecord::Migration[6.0]
  def change
    create_table :cabs do |t|
      t.string :vehicle_number
      t.integer :capacity
      t.timestamps
    end
  end
end
