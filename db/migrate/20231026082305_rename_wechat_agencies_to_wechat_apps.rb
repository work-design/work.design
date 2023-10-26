class RenameWechatAgenciesToWechatApps < ActiveRecord::Migration[7.1]
  def change
    drop_table :wechat_apps
    rename_table :wechat_agencies, :wechat_apps
  end
end
