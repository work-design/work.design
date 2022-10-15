class RenmaHomeToHomePath < ActiveRecord::Migration[7.0]
  def change
    rename_column :markdown_catalogs, :home, :home_path
  end
end
