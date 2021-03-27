class AddSourceToWechatUserTags < ActiveRecord::Migration[6.1]
  def change
    add_reference :wechat_user_tags, :source, polymorphic: true
  end
end
