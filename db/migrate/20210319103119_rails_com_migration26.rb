class RailsComMigration26 < ActiveRecord::Migration[6.1]

  def change


































































































    create_table :scenes do |t|
      t.references :organ
      t.references :wechat_response
      t.string :match_value
      t.integer :expire_seconds
      t.datetime :expire_at
      t.string :qrcode_ticket
      t.string :qrcode_url
      t.string :appid, index: true
      t.timestamps
    end


    add_column :wechat_responses, :enabled, :boolean, default: true
    remove_column :wechat_responses, :expire_seconds, :integer, scale: 4
    remove_column :wechat_responses, :qrcode_ticket, :string
    remove_column :wechat_responses, :qrcode_url, :string






































  end

end
