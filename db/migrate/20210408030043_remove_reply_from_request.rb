class RemoveReplyFromRequest < ActiveRecord::Migration[6.1]
  def change
    remove_column :wechat_requests, :reply_id
  end
end
