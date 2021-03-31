class AddMediaIdToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :ship_cars, :media_id, :string
    add_column :ship_drivers, :media_id, :string
  end
end
