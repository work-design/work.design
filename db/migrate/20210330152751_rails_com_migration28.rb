class RailsComMigration28 < ActiveRecord::Migration[6.1]

  def change














































































    rename_table :shipments, :ship_shipments

    create_table :ship_drivers do |t|
      t.references :user
      t.string :name
      t.string :code
      t.timestamps
    end

    create_table :ship_cars do |t|
      t.string :license_location
      t.string :license_number
      t.timestamps
    end


    remove_column :ship_lines, :start_location_id, :integer, scale: 8
    remove_column :ship_lines, :finish_location_id, :integer, scale: 8
    rename_table :packages, :ship_packages
    rename_table :packageds, :ship_packageds







































  end

end
