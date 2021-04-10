class RenameAppIdToAppid < ActiveRecord::Migration[6.1]
  def change
    rename_column :oauth_users, :app_id, :appid
    rename_column :wechat_templates, :app_id, :appid
  end
end
