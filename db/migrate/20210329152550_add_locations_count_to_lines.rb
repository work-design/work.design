class AddLocationsCountToLines < ActiveRecord::Migration[6.1]
  def change
    add_column :ship_lines, :locations_count, :integer, default: 0
    add_column :ship_locations, :position, :integer
  end
end
