class CreateHops < ActiveRecord::Migration[6.0]
  def change
    create_table :hops do |t|
      t.string :location
      t.integer :credit
      t.integer :sequence_id
      t.timestamps
    end
  end
end
