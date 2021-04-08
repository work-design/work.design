class AddUserToWechatResponses < ActiveRecord::Migration[6.1]
  def change
    add_reference :ship_lines, :user
  end
end
