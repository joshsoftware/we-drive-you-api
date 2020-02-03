class CreateRideRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :ride_requests do |t|
      t.string :location
      t.string :scheduled_type
      t.references :user
      t.references :ride
      t.timestamps
    end
  end
end
