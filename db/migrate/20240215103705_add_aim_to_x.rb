class AddAimToX < ActiveRecord::Migration[7.1]
  def change
    add_column :wechat_requests, :aim, :string
  end
end
