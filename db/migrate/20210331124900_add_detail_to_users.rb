class AddDetailToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :ship_cars, :detail, :jsonb
    add_column :ship_drivers, :detail, :jsonb
  end
end
