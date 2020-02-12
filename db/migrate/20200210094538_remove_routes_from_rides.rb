class RemoveRoutesFromRides < ActiveRecord::Migration[6.0]
  def change
    remove_column :rides, :routes, :text, array: true, default: [], using: "(string_to_array(routes, ','))"
  end
end
