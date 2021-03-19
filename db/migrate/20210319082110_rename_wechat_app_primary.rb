class RenameWechatAppPrimary < ActiveRecord::Migration[6.1]
  def change
    rename_column :wechat_apps, :primary, :shared
  end
end
