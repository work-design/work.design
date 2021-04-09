class DropWechatResponseRequests < ActiveRecord::Migration[6.1]
  def change
    drop_table :wechat_response_requests
  end
end
