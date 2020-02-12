class AddRidereferencesToHops < ActiveRecord::Migration[6.0]
  def change
    add_reference :hops, :ride, index: true
  end
end
