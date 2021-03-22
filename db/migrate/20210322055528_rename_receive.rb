class RenameReceive < ActiveRecord::Migration[6.1]
  def change
    rename_table :wechat_receiveds, :wechat_receives
    rename_table :wechat_subscribeds, :wechat_subscribes
  end
end
