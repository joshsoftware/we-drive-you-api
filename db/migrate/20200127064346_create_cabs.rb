class CreateCabs < ActiveRecord::Migration[5.2]
  def change
    create_table :cabs do |t|
      t.integer :cab_capacity   
      t.string :Vehicle_number
      t.integer :cab_id
      t.integer :driver_id
      t.timestamps
    end
  end
end
