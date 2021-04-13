class AddPoyphToLines < ActiveRecord::Migration[6.1]
  def change
    add_column :ship_lines, :pathway, :polygon
    add_index(:ship_lines, :pathway, using: 'gist', opclass: :poly_ops)
  end
end
