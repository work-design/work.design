class RenameProfileToShip < ActiveRecord::Migration[7.2]
  def change
    rename_table :profiled_areas, :ship_areas
    rename_table :profiled_addresses, :ship_addresses
    rename_table :profiled_address_organs, :ship_address_organs
    rename_table :profiled_address_uses, :ship_address_uses
    drop_table :profiled_profiles
    drop_table :profiled_avatars
  end
end
