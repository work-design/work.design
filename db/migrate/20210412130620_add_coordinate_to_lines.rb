class AddCoordinateToLines < ActiveRecord::Migration[6.1]
  def change
    add_column :ship_locations, :coordinate, :point
  end
end
