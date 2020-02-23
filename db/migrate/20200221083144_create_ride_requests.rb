class CreateRideRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :ride_requests do |t|
      t.references :hop
      t.references :user
      t.timestamps
    end
  end
end
