class AddSourceKindToWechatUserTags < ActiveRecord::Migration[6.1]
  def change
    add_column :wechat_user_tags, :source_kind, :string
  end
end
