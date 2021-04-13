class AddPathToLines < ActiveRecord::Migration[6.1]
  def change
    add_column :ship_lines, :path, :path
  end
end
