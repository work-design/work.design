class RemoveResponseIdFromScenes < ActiveRecord::Migration[6.1]
  def change
    remove_column :wechat_scenes, :response_id
  end
end
