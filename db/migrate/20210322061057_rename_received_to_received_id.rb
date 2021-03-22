class RenameReceivedToReceivedId < ActiveRecord::Migration[6.1]
  def change
    rename_column :wechat_requests, :received_id, :receive_id
    rename_column :wechat_notices, :subscribed_id, :subscribe_id
  end
end
