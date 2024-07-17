class AddReceiverIdToNotification < ActiveRecord::Migration[7.2]
  def change
    add_column :notice_notifications, :receiver_id, :bigint
  end
end
