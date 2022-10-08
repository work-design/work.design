class ExtendMigration19 < ActiveRecord::Migration[7.0]

  def change

    add_belongs_to :ship_box_proxy_buys, :box_host

    create_table :wechat_payees do |t|
      t.belongs_to :organ
      t.string :appid, index: true
      t.string :mch_id, comment: "支付专用、商户号"
      t.text :key
      t.text :key_v3
      t.string :serial_no
      t.text :apiclient_cert
      t.text :apiclient_key
      t.string :domain
      t.timestamps
    end

    remove_column :wechat_apps, :mch_id, :string
    remove_column :wechat_apps, :key, :string
    remove_column :wechat_apps, :apiclient_cert, :string
    remove_column :wechat_apps, :apiclient_key, :string
    remove_column :wechat_apps, :key_v3, :string, comment: "支付通知解密"
    remove_column :wechat_apps, :serial_no, :string

    add_column :trade_rents, :extra, :jsonb
  end

end
