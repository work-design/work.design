class AddWechatReceivedIdToWechat < ActiveRecord::Migration[6.1]

  def change
    add_reference :wechat_requests, :wechat_received
    remove_column :wechat_receiveds, :wechat_request_id
  end

end
