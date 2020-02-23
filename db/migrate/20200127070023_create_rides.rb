class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.time :time
      t.string :routes
      t.references :cab
      t.integer :available_seats
      t.string :type
      t.timestamps
    end
  end
end
