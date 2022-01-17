class ExtendMigration6 < ActiveRecord::Migration[7.0]

  def change
    add_column :datum_table_lists, :extra, :jsonb, default: {}

    add_belongs_to :ship_stations, :organ
    add_column :ship_stations, :area_ancestors, :jsonb

    add_belongs_to :finance_expense_members, :wallet
    remove_column :finance_expense_members, :cash_id, :integer, scale: 8

    add_column :markdown_posts, :nav, :boolean, default: false, comment: "是否导航菜单"

    create_table :wechat_providers do |t|
      t.string :name
      t.string :corp_id
      t.string :provider_secret
      t.string :suite_id
      t.string :secret
      t.string :token
      t.string :encoding_aes_key
      t.string :suite_ticket
      t.string :suite_ticket_pre
      t.timestamps
    end

    create_table :wechat_provider_tickets do |t|
      t.integer :timestamp
      t.string :nonce
      t.string :msg_signature
      t.string :suite_id
      t.string :ticket_data
      t.string :agent_id
      t.timestamps
    end

    add_column :wechat_news_reply_items, :raw_pic_url, :string

    add_belongs_to :factory_productions, :product_taxon

    add_belongs_to :trade_payouts, :wallet
    remove_column :trade_payouts, :cash_id, :integer, scale: 8

    add_column :trade_payments, :extra, :jsonb, default: {}

    add_belongs_to :trade_orders, :member
    add_belongs_to :trade_orders, :member_organ
  end

end
