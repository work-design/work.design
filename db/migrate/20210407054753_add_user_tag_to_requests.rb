class AddUserTagToRequests < ActiveRecord::Migration[6.1]
  def change
    add_reference :wechat_requests, :user_tag
  end
end
