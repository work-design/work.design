class ExtendMigration11 < ActiveRecord::Migration[7.0]

  def change

    add_belongs_to :com_debugs, :info

    create_table :crm_texts do |t|
      t.belongs_to :source
      t.string :note
      t.integer :margin_x, default: 0
      t.integer :margin_y, default: 0
      t.string :font, default: "simsun"
      t.string :align, default: "northwest"
      t.timestamps
    end

    create_table :crm_tags do |t|
      t.string :name
      t.string :logged_type
      t.string :entity_column
      t.string :entity_value
      t.string :color
      t.integer :sequence, default: 1
      t.timestamps
    end

    create_table :crm_source_contacts do |t|
      t.belongs_to :organ
      t.belongs_to :maintain_source
      t.belongs_to :source
      t.belongs_to :contact
      t.belongs_to :trade_item
      t.timestamps
    end

    create_table :crm_source_hierarchies do |t|
      t.belongs_to :ancestor
      t.belongs_to :descendant
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "crm/source_anc_desc_idx"
    end

    create_table :crm_sources do |t|
      t.belongs_to :parent
      t.string :name
      t.boolean :materialize, default: false
      t.integer :fixed_width, default: 0
      t.jsonb :parent_ancestors, default: {}
      t.string :sku
      t.decimal :price, default: 0
      t.decimal :advance_price, default: 0
      t.jsonb :vip_price, default: {}
      t.jsonb :extra, default: {}
      t.string :unit
      t.decimal :quantity, default: 0
      t.decimal :unified_quantity, default: 0
      t.string :good_type
      t.timestamps
    end

    create_table :crm_qrcodes do |t|
      t.belongs_to :source
      t.integer :margin_x, default: 0
      t.integer :margin_y, default: 0
      t.integer :fixed_width, default: 0
      t.string :align, default: "northwest"
      t.timestamps
    end

    create_table :crm_maintain_tags do |t|
      t.belongs_to :organ
      t.belongs_to :tag
      t.string :name
      t.string :logged_type
      t.string :entity_column
      t.string :entity_value
      t.integer :sequence, default: 1
      t.boolean :manual, default: true
      t.string :color, default: "#2A92CA"
      t.integer :maintain_logs_count, default: 0
      t.timestamps
    end

    create_table :crm_maintain_sources do |t|
      t.belongs_to :organ
      t.belongs_to :source
      t.string :name
      t.integer :maintains_count, default: 0
      t.timestamps
    end

    create_table :crm_maintain_logs do |t|
      t.belongs_to :member
      t.belongs_to :maintain
      t.belongs_to :logged, polymorphic: true
      t.belongs_to :maintain_tag
      t.string :note
      t.string :tag_str
      t.integer :tag_sequence
      t.jsonb :extra
      t.timestamps
    end

    create_table :crm_maintains do |t|
      t.belongs_to :organ
      t.belongs_to :member
      t.belongs_to :task_template
      t.belongs_to :payment_strategy
      t.belongs_to :client, polymorphic: true
      t.belongs_to :agent, polymorphic: true
      t.belongs_to :agency
      t.belongs_to :maintain_source
      t.belongs_to :upstream
      t.belongs_to :original
      t.string :note
      t.integer :position
      t.integer :deposit_ratio, default: 100, comment: "最小预付比例"
      t.string :state, default: "init"
      t.timestamps
    end

    create_table :crm_agencies do |t|
      t.belongs_to :agent, polymorphic: true
      t.belongs_to :client, polymorphic: true
      t.string :relation, default: "unknown"
      t.decimal :commission_ratio, comment: "交易时抽成比例"
      t.string :note, comment: "备注"
      t.timestamps
    end

    add_column :ship_stations, :poiname, :string
    add_column :ship_stations, :poiaddress, :string
    add_column :ship_stations, :cityname, :string
    add_column :ship_stations, :lat, :decimal
    add_column :ship_stations, :lng, :decimal
    add_column :ship_stations, :coordinate, :point

    add_belongs_to :ship_shipment_items, :loaded_station
    add_belongs_to :ship_shipment_items, :unloaded_station
    add_belongs_to :ship_shipment_items, :package
    add_belongs_to :ship_shipment_items, :box
    add_column :ship_shipment_items, :confirm_mode, :string
    add_column :ship_shipment_items, :status, :string
    remove_column :ship_shipment_items, :item_type, :string
    remove_column :ship_shipment_items, :item_id, :integer, scale: 8

    add_belongs_to :ship_shipments, :organ
    add_column :ship_shipments, :shipment_items_count, :integer, default: 0
    add_column :ship_shipments, :expected_minutes, :integer, comment: "预计路途分钟数"

    add_belongs_to :ship_packages, :organ
    add_belongs_to :ship_packages, :from_address
    add_belongs_to :ship_packages, :from_station
    add_belongs_to :ship_packages, :station
    add_belongs_to :ship_packages, :last_box
    add_belongs_to :ship_packages, :current_shipment
    add_column :ship_packages, :confirm_mode, :string
    add_column :ship_packages, :packageds_count, :integer, default: 0
    add_column :ship_packages, :shipment_items_count, :integer, default: 0
    remove_column :ship_packages, :wait_item_id, :integer, scale: 8
    remove_column :ship_packages, :loaded_at, :datetime, precision: 6
    remove_column :ship_packages, :unloaded_at, :datetime, precision: 6

    create_table :ship_line_stations do |t|
      t.belongs_to :organ
      t.belongs_to :line
      t.belongs_to :station
      t.integer :position
      t.timestamps
    end

    add_column :ship_lines, :line_stations_count, :integer, default: 0
    remove_column :ship_lines, :locations_count, :integer, scale: 4, default: "0"

    add_column :ship_box_specifications, :code, :string
    remove_column :ship_box_specifications, :organ_id, :integer, scale: 8

    add_column :ship_boxes, :shipment_items_count, :integer, default: 0
    remove_column :ship_boxes, :loaded_at, :datetime, precision: 6
    remove_column :ship_boxes, :unloaded_at, :datetime, precision: 6

    add_belongs_to :finance_funds, :user
    remove_column :finance_funds, :buyer_id, :integer, scale: 8

    add_belongs_to :wechat_corp_users, :organ
    add_column :wechat_corp_users, :follows_count, :integer, default: 0

    add_column :wechat_requests, :userid, :string, index: true

    remove_column :trade_carts, :myself, :boolean, default: "true", comment: "自己下单，即 member.user.id == user_id"

    add_belongs_to :profiled_addresses, :organ
    add_belongs_to :profiled_addresses, :agent
    add_column :profiled_addresses, :principal, :boolean, default: false

    add_column :trade_wallet_templates, :unit_name, :string
    add_column :trade_wallet_templates, :rate, :string, comment: "相对于默认货币的比率"
    add_column :trade_wallet_templates, :unit, :string
    remove_column :trade_wallet_templates, :currency, :string, default: "CNY"

    create_table :trade_units do |t|
      t.boolean :default
      t.decimal :rate, comment: "相对于默认单位的计算比率"
      t.string :name
      t.string :code
      t.string :metering
      t.timestamps
    end

    create_table :trade_rents do |t|
      t.belongs_to :user
      t.belongs_to :member
      t.belongs_to :member_organ
      t.belongs_to :rentable, polymorphic: true
      t.belongs_to :trade_item
      t.decimal :amount, comment: "价格小计"
      t.datetime :rent_start_at
      t.datetime :rent_estimate_finish_at
      t.datetime :rent_finish_at
      t.string :job_id
      t.timestamps
    end

    add_column :trade_promotes, :unit_code, :string

    remove_column :trade_cards, :amount, :decimal, limit: 2, precision: 10
    remove_column :trade_cards, :expense_amount, :decimal, limit: 2, precision: 10
    remove_column :trade_cards, :income_amount, :decimal, limit: 2, precision: 10

    remove_column :trade_promote_charges, :unit, :string

    add_belongs_to :trade_trade_items, :station
    add_belongs_to :trade_trade_items, :from_address
    add_belongs_to :trade_trade_items, :from_station
    add_belongs_to :trade_trade_items, :current_cart
    add_column :trade_trade_items, :uuid, :string
    add_column :trade_trade_items, :duration, :integer, default: 0, comment: "占用时长"
    add_column :trade_trade_items, :volume, :integer, default: 0, comment: "体积"
    remove_column :trade_trade_items, :unit, :string, comment: "单位"

    add_column :trade_promote_goods, :aim, :string, default: "use"

    add_belongs_to :trade_orders, :agent
    add_belongs_to :trade_orders, :station
    add_belongs_to :trade_orders, :from_address
    add_belongs_to :trade_orders, :from_station
    add_belongs_to :trade_orders, :current_cart
    add_column :trade_orders, :pay_later, :boolean, default: false
    add_column :trade_orders, :collectable, :boolean, default: false
    add_column :trade_orders, :payment_kind, :string
    remove_column :trade_orders, :myself, :boolean

    create_table :profiled_address_uses do |t|
      t.belongs_to :address
      t.string :kind
      t.timestamps
    end

    add_belongs_to :auth_authorized_tokens, :member
  end

end
