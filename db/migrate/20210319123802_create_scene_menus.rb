class CreateSceneMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :scene_menus do |t|
      t.references :scene
      t.references :wechat_menu
      t.timestamps
    end
  end
end
