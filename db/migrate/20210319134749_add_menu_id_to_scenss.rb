class AddMenuIdToScenss < ActiveRecord::Migration[6.1]
  def change
    add_column :scenes, :menu_id, :string
  end
end
