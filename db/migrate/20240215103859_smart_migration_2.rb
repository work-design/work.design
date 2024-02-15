class SmartMigration2 < ActiveRecord::Migration[7.1]

  def change

    create_table :debug_throughs do |t|
      t.belongs_to :many
      t.belongs_to :much
      t.string :name
      t.timestamps
    end

    create_table :debug_ones do |t|
      t.string :name
      t.string :state
      t.timestamps
    end

    create_table :debug_muches do |t|
      t.string :name
      t.timestamps
    end

    create_table :debug_manies do |t|
      t.belongs_to :one
      t.string :name
      t.timestamps
    end

    add_column :wechat_requests, :tag_name, :string
    add_column :wechat_requests, :handle_id, :integer
    remove_column :wechat_requests, :init_wechat_user, :boolean
    remove_column :wechat_requests, :init_user_tag, :boolean

    add_column :wechat_apps, :webview_domain, :string

    add_belongs_to :factory_production_provides, :product_taxon

    create_table :trade_refund_orders do |t|
      t.belongs_to :order
      t.belongs_to :payment
      t.belongs_to :refund
      t.decimal :payment_amount
      t.decimal :order_amount, comment: "对应的订单金额"
      t.string :state
      t.timestamps
    end

    remove_column :trade_payment_orders, :user_id, :integer, scale: 8
    remove_column :trade_payment_orders, :wallet_code, :string

    add_column :trade_wallets, :refunded_amount, :decimal, comment: "收入：退款"

    remove_column :trade_refunds, :order_id, :integer, scale: 8
    remove_column :trade_refunds, :organ_id, :integer, scale: 8

    add_column :auth_apps, :key, :string
    remove_column :auth_apps, :jwt_key, :string

    add_column :auth_authorized_tokens, :encrypted_token, :string
    remove_column :auth_authorized_tokens, :mock_member, :boolean

    remove_column :auth_oauth_users, :user_inviter_id, :integer, scale: 8
  end

end
