class ExtendMigration7 < ActiveRecord::Migration[7.0]

  def change

    create_table :com_debugs do |t|
      t.string :name
      t.timestamps
    end

    add_belongs_to :markdown_posts, :organ

    create_table :wechat_corp_users do |t|
      t.belongs_to :provider
      t.string :corp_id, index: true
      t.string :user_id
      t.string :device_id
      t.string :user_ticket
      t.datetime :ticket_expires_at
      t.string :open_userid
      t.string :open_id
      t.string :identity
      t.string :name
      t.string :gender
      t.string :avatar_url
      t.string :qr_code
      t.integer :department, array: []
      t.timestamps
    end

    add_column :wechat_providers, :access_token, :string
    add_column :wechat_providers, :access_token_expires_at, :datetime
    add_column :wechat_providers, :pre_auth_code, :string
    add_column :wechat_providers, :pre_auth_code_expires_at, :datetime
    add_column :wechat_providers, :provider_access_token, :string
    add_column :wechat_providers, :provider_access_token_expires_at, :datetime

    add_column :wechat_provider_tickets, :message_hash, :jsonb
    add_column :wechat_provider_tickets, :info_type, :string

    create_table :wechat_corps do |t|
      t.belongs_to :organ
      t.belongs_to :provider
      t.string :name
      t.string :corp_id, index: true
      t.string :corp_type
      t.string :subject_type
      t.datetime :verified_end_at
      t.string :square_logo_url
      t.integer :user_max
      t.string :full_name
      t.string :wxqrcode
      t.string :industry
      t.string :sub_industry
      t.string :location
      t.jsonb :auth_corp_info
      t.jsonb :auth_user_info
      t.jsonb :register_code_info
      t.jsonb :agent
      t.string :access_token
      t.datetime :access_token_expires_at
      t.string :jsapi_ticket
      t.datetime :jsapi_ticket_expires_at
      t.string :permanent_code
      t.timestamps
    end

    create_table :wechat_provider_receives do |t|
      t.belongs_to :provider
      t.string :corp_id, index: true
      t.string :user_id, index: true
      t.string :agent_id
      t.string :msg_id
      t.string :msg_type
      t.string :event
      t.string :event_key
      t.string :content
      t.string :encrypt_data
      t.jsonb :message_hash
      t.string :msg_format, default: "xml"
      t.timestamps
    end

    add_column :trade_carts, :myself, :boolean, default: true, comment: "自己下单，即 member.user.id == user_id"
    remove_column :trade_carts, :current, :boolean, default: "false"

    add_column :factory_scenes, :automatic, :boolean, default: false

    add_belongs_to :factory_productions, :organ
    add_column :factory_productions, :automatic, :boolean, default: false

    add_belongs_to :trade_trade_promotes, :organ
    add_belongs_to :trade_trade_promotes, :user
    add_belongs_to :trade_trade_promotes, :member
    add_belongs_to :trade_trade_promotes, :member_organ

    add_belongs_to :trade_cards, :user
    add_belongs_to :trade_cards, :member
    add_belongs_to :trade_cards, :member_organ

    add_belongs_to :trade_payment_references, :user
    add_belongs_to :trade_payment_references, :member

    add_belongs_to :trade_trade_items, :member_organ
    add_belongs_to :trade_trade_items, :agent
    add_belongs_to :trade_trade_items, :scene
  end

end
