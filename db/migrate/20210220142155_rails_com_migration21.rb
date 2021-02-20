class RailsComMigration21 < ActiveRecord::Migration[6.1]

  def change

















































































































    add_column :wechat_apps, :key_v3, :string, comment: "支付通知解密"
    add_column :wechat_apps, :serial_no, :string

































    add_reference :refunds, :organ





















































    add_column :rules, :required_parts, :string, array: true




    










    add_column :acme_orders, :status, :string

    add_column :acme_identifiers, :token, :string


















  end

end
