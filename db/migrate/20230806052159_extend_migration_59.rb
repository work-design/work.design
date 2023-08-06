class ExtendMigration59 < ActiveRecord::Migration[7.0]

  def change
    add_column :wechat_agencies, :jsapi_ticket, :string
    add_column :wechat_agencies, :jsapi_ticket_expires_at, :datetime
    add_column :wechat_agencies, :enabled, :boolean
    add_column :wechat_agencies, :global, :boolean
    add_column :wechat_agencies, :oauth_enable, :boolean
    add_column :wechat_agencies, :inviting, :boolean, comment: "可邀请加入"
    add_column :wechat_agencies, :secret, :text
    add_column :wechat_agencies, :token, :string
    add_column :wechat_agencies, :encrypt_mode, :boolean
    add_column :wechat_agencies, :encoding_aes_key, :string
    add_column :wechat_agencies, :url_link, :string
    add_column :wechat_agencies, :debug, :boolean
    add_column :wechat_agencies, :weapp_id, :string, comment: "关联的小程序"
  end

end
