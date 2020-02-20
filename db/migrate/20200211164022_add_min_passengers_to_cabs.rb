class AddMinPassengersToCabs < ActiveRecord::Migration[6.0]
  def change
    add_column :cabs, :min_passengers, :integer
  end
end
