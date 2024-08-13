class RenameMoreProfield < ActiveRecord::Migration[7.2]
  def change
    rename_table :profiled_area_hierarchies, :ship_area_hierarchies
  end
end
