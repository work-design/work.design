class AddNumberToDriver < ActiveRecord::Migration[6.1]
  def change
    rename_column :ship_cars, :license_location, :location
    rename_column :ship_cars, :license_number, :number
    rename_column :ship_drivers, :code, :number
  end
end
