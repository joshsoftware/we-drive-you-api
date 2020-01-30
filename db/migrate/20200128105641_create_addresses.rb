class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true
      t.string :landmark
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :pin_code

      t.timestamps
    end
  end
end
