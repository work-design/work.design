class ExtendMigration15 < ActiveRecord::Migration[7.0]

  def change

    add_belongs_to :ship_packageds, :good_item, polymorphic: true

    add_belongs_to :ship_box_logs, :boxed, polymorphic: true
    remove_column :ship_box_logs, :package_id, :integer, scale: 8

    create_table :ship_box_hosts do |t|
      t.belongs_to :organ
      t.belongs_to :box_specification
      t.integer :boxes_count, default: 0
      t.integer :rented_count, default: 0
      t.integer :rentable_count, default: 0
      t.timestamps
    end

    create_table :ship_box_holds do |t|
      t.belongs_to :box_specification
      t.belongs_to :organ
      t.belongs_to :user
      t.belongs_to :member
      t.integer :boxes_count, default: 0
      t.integer :saleable
      t.integer :buyable
      t.string :name
      t.string :sku
      t.decimal :price, default: 0
      t.decimal :advance_price, default: 0
      t.jsonb :card_price, default: {}
      t.jsonb :wallet_price, default: {}
      t.jsonb :extra, default: {}
      t.string :unit
      t.decimal :quantity, default: 0
      t.decimal :unified_quantity, default: 0
      t.decimal :invest_ratio, default: 0, comment: "抽成比例"
      t.string :good_type
      t.timestamps
    end

    add_column :bench_facilitates, :card_price, :jsonb, default: {}
    add_column :bench_facilitates, :wallet_price, :jsonb, default: {}
    add_column :bench_facilitates, :invest_ratio, :decimal, default: 0, comment: "抽成比例"
    remove_column :bench_facilitates, :vip_price, :jsonb, default: "{}"

    create_table :serve_servings do |t|
      t.belongs_to :service
      t.belongs_to :server
      t.belongs_to :member
      t.belongs_to :wallet_payment
      t.belongs_to :item
      t.datetime :start_at
      t.datetime :finish_at
      t.datetime :estimate_finish_at
      t.timestamps
    end

    create_table :serve_services do |t|
      t.belongs_to :organ
      t.string :name
      t.string :sku
      t.decimal :price, default: 0
      t.decimal :advance_price, default: 0
      t.jsonb :card_price, default: {}
      t.jsonb :wallet_price, default: {}
      t.jsonb :extra, default: {}
      t.string :unit
      t.decimal :quantity, default: 0
      t.decimal :unified_quantity, default: 0
      t.decimal :invest_ratio, default: 0, comment: "抽成比例"
      t.string :good_type
      t.timestamps
    end

    create_table :serve_servers do |t|
      t.belongs_to :service
      t.belongs_to :member
      t.string :name
      t.timestamps
    end

    add_column :finance_funds, :card_price, :jsonb, default: {}
    add_column :finance_funds, :wallet_price, :jsonb, default: {}
    add_column :finance_funds, :invest_ratio, :decimal, default: 0, comment: "抽成比例"
    remove_column :finance_funds, :vip_price, :jsonb, default: "{}"

    add_column :wechat_corp_users, :temp_identity, :string

    add_column :factory_production_items, :code, :string
    remove_column :factory_production_items, :qr_code, :string

    add_column :factory_productions, :card_price, :jsonb, default: {}
    add_column :factory_productions, :wallet_price, :jsonb, default: {}
    add_column :factory_productions, :invest_ratio, :decimal, default: 0, comment: "抽成比例"
    remove_column :factory_productions, :vip_price, :jsonb, default: "{}"

    create_table :factory_product_hosts do |t|
      t.belongs_to :organ
      t.belongs_to :product
      t.decimal :profit_margin, default: 0
      t.decimal :min_price
      t.decimal :max_price
      t.timestamps
    end

    remove_column :factory_products, :profit_margin, :decimal, limit: 2, precision: 4
    remove_column :factory_products, :min_price, :decimal
    remove_column :factory_products, :max_price, :decimal
    remove_column :factory_products, :upstream_product_id, :integer, scale: 8
    remove_column :factory_products, :source_product_id, :integer, scale: 8

    add_belongs_to :trade_carts, :maintain
    add_belongs_to :trade_carts, :client

    add_column :crm_sources, :card_price, :jsonb, default: {}
    add_column :crm_sources, :wallet_price, :jsonb, default: {}
    add_column :crm_sources, :invest_ratio, :decimal, default: 0, comment: "抽成比例"
    remove_column :crm_sources, :vip_price, :jsonb, default: "{}"

    add_column :crm_maintains, :wallets_count, :integer, default: 0
    add_column :crm_maintains, :cards_count, :integer, default: 0
    add_column :crm_maintains, :orders_count, :integer, default: 0
    add_column :crm_maintains, :addresses_count, :integer, default: 0
    remove_column :crm_maintains, :client_type, :string

    add_column :trade_wallet_templates, :enabled, :boolean, default: true
    remove_column :trade_wallet_templates, :default, :boolean

    add_belongs_to :trade_wallet_advances, :operator

    add_column :trade_rents, :start_at, :datetime
    add_column :trade_rents, :finish_at, :datetime
    add_column :trade_rents, :estimate_finish_at, :datetime
    add_column :trade_rents, :invest_amount, :decimal, comment: "投资分成"
    remove_column :trade_rents, :rent_start_at, :datetime, precision: 6
    remove_column :trade_rents, :rent_estimate_finish_at, :datetime, precision: 6
    remove_column :trade_rents, :rent_finish_at, :datetime, precision: 6

    add_column :trade_purchases, :card_price, :jsonb, default: {}
    add_column :trade_purchases, :wallet_price, :jsonb, default: {}
    add_column :trade_purchases, :invest_ratio, :decimal, default: 0, comment: "抽成比例"
    remove_column :trade_purchases, :vip_price, :jsonb, default: "{}"

    add_column :trade_payment_orders, :payment_amount, :decimal
    add_column :trade_payment_orders, :order_amount, :decimal
    add_column :trade_payment_orders, :wallet_code, :string
    remove_column :trade_payment_orders, :check_amount, :decimal, limit: 2, precision: 10

    add_column :trade_advances, :card_price, :jsonb, default: {}
    add_column :trade_advances, :wallet_price, :jsonb, default: {}
    add_column :trade_advances, :invest_ratio, :decimal, default: 0, comment: "抽成比例"
    remove_column :trade_advances, :vip_price, :jsonb, default: "{}"

    add_belongs_to :trade_payments, :operator

    add_belongs_to :trade_wallets, :maintain
    add_belongs_to :trade_wallets, :client
    add_column :trade_wallets, :name, :string
    remove_column :trade_wallets, :default, :boolean

    add_belongs_to :trade_orders, :maintain
    add_belongs_to :trade_orders, :client

    add_belongs_to :trade_items, :client
    add_column :trade_items, :rents_count, :integer, default: 0
    add_column :trade_items, :renting_count, :integer, default: 0
    add_column :trade_items, :delivery, :string, default: "init"

    add_belongs_to :trade_cards, :maintain

    add_column :org_organ_domains, :scheme, :string, default: "https"
  end

end
