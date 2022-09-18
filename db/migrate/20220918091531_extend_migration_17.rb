class ExtendMigration17 < ActiveRecord::Migration[7.0]

  def change

    add_column :com_acme_identifiers, :type, :string

    add_belongs_to :ship_box_sells, :user
    add_belongs_to :ship_box_sells, :member
    add_belongs_to :ship_box_sells, :member_organ
    add_column :ship_box_sells, :amount, :integer
    add_column :ship_box_sells, :done_amount, :integer
    add_column :ship_box_sells, :rest_amount, :integer
    add_column :ship_box_sells, :state, :string
    remove_column :ship_box_sells, :sellable_count, :integer, scale: 4, default: "0"
    remove_column :ship_box_sells, :name, :string
    remove_column :ship_box_sells, :sku, :string
    remove_column :ship_box_sells, :advance_price, :decimal, default: "0.0"
    remove_column :ship_box_sells, :card_price, :jsonb, default: "{}"
    remove_column :ship_box_sells, :wallet_price, :jsonb, default: "{}"
    remove_column :ship_box_sells, :extra, :jsonb, default: "{}"
    remove_column :ship_box_sells, :unit, :string
    remove_column :ship_box_sells, :quantity, :decimal, default: "0.0"
    remove_column :ship_box_sells, :unified_quantity, :decimal, default: "0.0"
    remove_column :ship_box_sells, :invest_ratio, :decimal, default: "0.0", comment: "抽成比例"
    remove_column :ship_box_sells, :good_type, :string

    create_table :ship_box_proxy_sells do |t|
      t.belongs_to :box_specification
      t.belongs_to :organ
      t.integer :sellable_count
      t.decimal :price
      t.timestamps
    end

    create_table :ship_box_proxy_buys do |t|
      t.belongs_to :box_specification
      t.belongs_to :organ
      t.integer :buyable_count
      t.decimal :price
      t.timestamps
    end

    add_column :ship_box_hosts, :name, :string
    add_column :ship_box_hosts, :sku, :string
    add_column :ship_box_hosts, :price, :decimal
    add_column :ship_box_hosts, :advance_price, :decimal
    add_column :ship_box_hosts, :card_price, :jsonb
    add_column :ship_box_hosts, :wallet_price, :jsonb
    add_column :ship_box_hosts, :extra, :jsonb
    add_column :ship_box_hosts, :unit, :string
    add_column :ship_box_hosts, :quantity, :decimal
    add_column :ship_box_hosts, :unified_quantity, :decimal
    add_column :ship_box_hosts, :invest_ratio, :decimal, comment: "抽成比例"
    add_column :ship_box_hosts, :good_type, :string
    add_column :ship_box_hosts, :tradable_count, :integer, comment: "可交易数量，可租亦可卖"
    add_column :ship_box_hosts, :traded_count, :virtual, type: :integer, as: "boxes_count - tradable_count", stored: true
    remove_column :ship_box_hosts, :rented_count, :integer, scale: 4, default: "0"
    remove_column :ship_box_hosts, :rentable_count, :integer, scale: 4, default: "0"

    add_column :ship_box_holds, :rented_amount, :integer
    add_column :ship_box_holds, :owned_amount, :integer
    add_column :ship_box_holds, :box_host_id, :integer
    remove_column :ship_box_holds, :buyable, :integer, scale: 4
    remove_column :ship_box_holds, :sellable, :integer, scale: 4
    remove_column :ship_box_holds, :sell_price, :decimal
    remove_column :ship_box_holds, :buy_price, :decimal

    remove_column :wechat_suite_tickets, :suite_id
    add_column :wechat_suite_tickets, :suiteid, :string
    add_belongs_to :wechat_suite_tickets, :suite

    create_table :wechat_developers do |t|
      t.string :name
      t.string :token
      t.string :encoding_aes_key
      t.timestamps
    end

    remove_column :crm_maintains, :note, :string

    remove_column :trade_wallet_templates, :unit_kind, :string

    create_table :trade_wallet_sells do |t|
      t.belongs_to :operator
      t.belongs_to :wallet
      t.belongs_to :item
      t.belongs_to :selled, polymorphic: true
      t.decimal :amount
      t.string :note
      t.string :state
      t.timestamps
    end

    add_column :trade_wallet_prepayments, :lawful, :boolean

    remove_column :trade_rents, :item_id, :integer, scale: 8

    add_belongs_to :trade_advances, :organ
    add_column :trade_advances, :lawful, :boolean, comment: "是否法币"

    add_column :trade_wallets, :type, :string
    add_column :trade_wallets, :advances_amount, :decimal
    add_column :trade_wallets, :sells_amount, :decimal

    add_column :trade_orders, :pay_auto, :boolean

    add_column :trade_items, :done_number, :integer, comment: "已达成交易数量"
    add_column :trade_items, :rest_number, :integer
    remove_column :trade_items, :rents_count, :integer, scale: 4, default: "0"
    remove_column :trade_items, :renting_count, :integer, scale: 4, default: "0"
  end

end
