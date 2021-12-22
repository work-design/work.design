class ExtendMigration5 < ActiveRecord::Migration[7.0]

  def change

    add_belongs_to :profiled_addresses, :station
    add_column :profiled_addresses, :floor, :string, comment: "楼层"
    add_column :profiled_addresses, :room, :string, comment: "房间号"

    remove_column :trade_payments, :card_id, :integer, scale: 8

    create_table :trade_wallet_prepayments do |t|
      t.belongs_to :wallet_template
      t.string :token
      t.decimal :amount
      t.datetime :expire_at
      t.timestamps
    end

    create_table :trade_wallets do |t|
      t.belongs_to :cart
      t.belongs_to :wallet_template
      t.decimal :amount, default: 0
      t.decimal :withdrawable_amount, comment: "可提现的额度"
      t.decimal :income_amount, default: 0
      t.decimal :expense_amount, default: 0
      t.string :account_bank
      t.string :account_name
      t.string :account_number
      t.integer :lock_version
      t.boolean :default
      t.timestamps
    end

    create_table :trade_card_purchases do |t|
      t.belongs_to :card
      t.belongs_to :trade_item
      t.belongs_to :purchase
      t.decimal :price
      t.integer :days, default: 0
      t.integer :months, default: 0
      t.integer :years, default: 0
      t.string :state
      t.string :note
      t.date :last_expire_on
      t.string :kind
      t.timestamps
    end

    create_table :trade_wallet_logs do |t|
      t.belongs_to :wallet
      t.belongs_to :source, polymorphic: true
      t.string :title
      t.string :tag_str
      t.decimal :amount
      t.timestamps
    end

    create_table :trade_wallet_templates do |t|
      t.belongs_to :organ
      t.string :name
      t.string :description
      t.string :currency, default: "CNY"
      t.integer :wallets_count, default: 0
      t.string :code
      t.string :platform
      t.boolean :default
      t.timestamps
    end

    create_table :trade_wallet_advances do |t|
      t.belongs_to :wallet
      t.belongs_to :advance
      t.belongs_to :trade_item
      t.belongs_to :card_prepayment
      t.decimal :price
      t.decimal :amount
      t.string :state
      t.string :note
      t.string :kind
      t.timestamps
    end

    remove_column :trade_cards, :currency, :string

    add_belongs_to :trade_advances, :wallet_template
    add_column :trade_advances, :vip_price, :jsonb, default: {}

    create_table :trade_privileges do |t|
      t.belongs_to :card_template
      t.belongs_to :privileged, polymorphic: true
      t.string :name
      t.integer :amount, comment: "额度"
      t.decimal :price, comment: "价格"
      t.string :code
      t.integer :position
      t.timestamps
    end

    create_table :trade_purchases do |t|
      t.belongs_to :card_template
      t.string :name
      t.string :sku
      t.decimal :price
      t.decimal :advance_price, default: 0
      t.jsonb :vip_price, default: {}
      t.jsonb :extra, default: {}
      t.string :unit
      t.decimal :quantity, default: 0
      t.decimal :unified_quantity, default: 0
      t.string :title
      t.string :note
      t.integer :years, default: 0
      t.integer :months, default: 0
      t.integer :days, default: 0
      t.boolean :default, default: false
      t.timestamps
    end

    add_column :trade_card_templates, :cards_count, :integer, default: 0
    add_column :trade_card_templates, :code, :string
    add_column :trade_card_templates, :grade, :integer, default: 1, comment: "会员级别"
    remove_column :trade_card_templates, :valid_days, :integer, scale: 4
    remove_column :trade_card_templates, :valid_years, :integer, scale: 4, default: "0"
    remove_column :trade_card_templates, :valid_months, :integer, scale: 4, default: "0"
    remove_column :trade_card_templates, :currency, :string
    remove_column :trade_card_templates, :default, :boolean

    add_column :factory_productions, :enabled, :boolean, default: false
    add_column :factory_productions, :vip_price, :jsonb, default: {}

    remove_column :factory_products, :enabled, :boolean, default: "false"

    create_table :wechat_request_responses do |t|
      t.belongs_to :response
      t.string :request_type
      t.string :appid
      t.timestamps
    end

    add_column :finance_funds, :vip_price, :jsonb, default: {}

    add_column :bench_facilitates, :vip_price, :jsonb, default: {}


    create_table :ship_stations do |t|
      t.belongs_to :area
      t.string :name
      t.string :detail
      t.timestamps
    end

  end

end
