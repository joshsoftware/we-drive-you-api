class ChangeRoutesTypeInRides < ActiveRecord::Migration[5.2]
  def change
    change_column :rides, :routes, :text, array: true, default: [], using: "(string_to_array(routes, ','))"
  end
end
