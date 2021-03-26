class RenameWechatUsersCountToWechatTags < ActiveRecord::Migration[6.1]
  def change
    rename_column :wechat_tags, :wechat_user_tags_count, :user_tags_count
  end
end
