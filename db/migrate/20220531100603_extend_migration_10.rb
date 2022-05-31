class ExtendMigration10 < ActiveRecord::Migration[7.0]

  def change

    create_table :ship_car_drivers do |t|
      t.belongs_to :car
      t.belongs_to :driver
      t.jsonb :repeat_days
      t.string :event_type
      t.timestamps
    end

    create_table :ship_boxes do |t|
      t.belongs_to :organ
      t.belongs_to :box_specification
      t.string :code
      t.datetime :loaded_at
      t.datetime :unloaded_at
      t.string :status
      t.string :state
      t.timestamps
    end

    add_belongs_to :ship_packages, :box
    add_column :ship_packages, :boxed_in_at, :datetime
    add_column :ship_packages, :boxed_out_at, :datetime
    add_column :ship_packages, :loaded_at, :datetime
    add_column :ship_packages, :unloaded_at, :datetime

    create_table :ship_user_lines do |t|
      t.belongs_to :line
      t.belongs_to :user
      t.timestamps
    end

    remove_column :ship_lines, :user_id, :integer, scale: 8
    remove_column :ship_lines, :path, :path
    remove_column :ship_lines, :pathway, :polygon

    create_table :ship_shipment_items do |t|
      t.belongs_to :item, polymorphic: true
      t.belongs_to :shipment
      t.datetime :loaded_at
      t.datetime :unloaded_at
      t.string :state
      t.timestamps
    end

    create_table :ship_box_specifications do |t|
      t.belongs_to :organ
      t.string :name
      t.integer :width
      t.integer :length
      t.integer :height
      t.integer :boxes_count, default: 0
      t.string :unit
      t.timestamps
    end

    create_table :ship_item_shipments do |t|
      t.belongs_to :item, polymorphic: true
      t.belongs_to :shipment
      t.datetime :loaded_at
      t.datetime :unloaded_at
      t.timestamps
    end

    add_column :ship_locations, :name, :string

    add_belongs_to :ship_cars, :organ
    add_column :ship_cars, :brand, :string, comment: "车品牌"
    add_column :ship_cars, :tel, :string, comment: "随车电话"
    add_column :ship_cars, :carriage, :string
    add_column :ship_cars, :kind, :string
    remove_column :ship_cars, :user_id, :integer, scale: 8

    create_table :ship_package_shipments do |t|
      t.belongs_to :box
      t.belongs_to :package
      t.belongs_to :shipment
      t.timestamps
    end

    add_belongs_to :ship_shipments, :line
    add_belongs_to :ship_shipments, :car
    add_belongs_to :ship_shipments, :driver
    add_column :ship_shipments, :type, :string
    add_column :ship_shipments, :left_at, :datetime
    add_column :ship_shipments, :arrived_at, :datetime
    add_column :ship_shipments, :load_on, :date
    remove_column :ship_shipments, :package_id, :integer, scale: 8
    remove_column :ship_shipments, :address_id, :integer, scale: 8

    add_belongs_to :ship_drivers, :organ
    add_belongs_to :ship_drivers, :member

    create_table :factory_provides do |t|
      t.belongs_to :organ
      t.belongs_to :provider
      t.timestamps
    end

    add_column :trade_carts, :good_type, :string
    add_column :trade_carts, :aim, :string
    add_column :trade_carts, :trade_items_count, :integer, default: 0

    add_belongs_to :factory_part_providers, :upstream_product
    add_belongs_to :factory_part_providers, :upstream_production
    add_column :factory_part_providers, :cost_price, :decimal
    remove_column :factory_part_providers, :part_id, :integer, scale: 8
    remove_column :factory_part_providers, :export_price, :decimal

    add_belongs_to :profiled_addresses, :user
    add_belongs_to :profiled_addresses, :member
    add_belongs_to :profiled_addresses, :member_organ

    create_table :factory_fits do |t|
      t.belongs_to :product
      t.belongs_to :production
      t.belongs_to :part_brand
      t.belongs_to :part_serial
      t.belongs_to :part_product
      t.belongs_to :part_production
      t.string :grade
      t.timestamps
    end

    create_table :factory_unifiers do |t|
      t.string :name
      t.string :code
      t.timestamps
    end

    add_column :factory_product_taxons, :take_stock, :boolean, comment: "可盘点"
    add_column :factory_product_taxons, :partial, :boolean, default: false

    add_belongs_to :factory_products, :unifier
    add_belongs_to :factory_products, :brand
    add_belongs_to :factory_products, :upstream_product
    add_belongs_to :factory_products, :source_product
    add_column :factory_products, :type, :string
    add_column :factory_products, :specialty, :boolean, default: false
    add_column :factory_products, :fits_count, :integer, default: 0
    add_column :factory_products, :part_providers_count, :integer, default: 0
    add_column :factory_products, :product_taxon_ancestors, :jsonb

    create_table :factory_serial_hierarchies do |t|
      t.belongs_to :ancestor
      t.belongs_to :descendant
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "factory/serial_anc_desc_idx"
    end

    create_table :factory_serials do |t|
      t.belongs_to :brand
      t.belongs_to :parent
      t.string :name
      t.integer :position
      t.integer :products_count, default: 0
      t.jsonb :parent_ancestors, default: {}
      t.timestamps
    end

    add_belongs_to :factory_production_items, :product_item
    add_column :factory_production_items, :came_at, :datetime
    remove_column :factory_production_items, :produced_at, :datetime

    remove_column :factory_parts, :part_taxon_id, :integer, scale: 8
    remove_column :factory_parts, :name, :string
    remove_column :factory_parts, :description, :string
    remove_column :factory_parts, :qr_prefix, :string
    remove_column :factory_parts, :sku, :string
    remove_column :factory_parts, :type, :string
    remove_column :factory_parts, :order_items_count, :integer, scale: 4, default: "0"
    remove_column :factory_parts, :published, :boolean, default: "true"
    remove_column :factory_parts, :price, :decimal, limit: 2, precision: 10
    remove_column :factory_parts, :import_price, :decimal, limit: 2, precision: 10
    remove_column :factory_parts, :profit_price, :decimal, limit: 2, precision: 10
    remove_column :factory_parts, :organ_id, :integer, scale: 8
    remove_column :factory_parts, :part_providers_count, :integer, scale: 4, default: "0"

    create_table :factory_brands do |t|
      t.belongs_to :organ
      t.string :name
      t.string :code
      t.integer :products_count, default: 0
      t.timestamps
    end

    add_belongs_to :trade_card_templates, :promote

    add_belongs_to :trade_privileges, :promote
    remove_column :trade_privileges, :privileged_type, :string
    remove_column :trade_privileges, :privileged_id, :integer, scale: 8

    add_column :trade_cards, :temporary, :boolean, default: false, comment: "在购物车勾选临时生效"

    remove_column :trade_cart_promotes, :promote_good_id, :integer, scale: 8

    add_column :trade_orders, :serial_number, :string
    add_column :trade_orders, :paid_at, :datetime, index: true

    add_column :trade_promote_goods, :use_limit, :integer
    add_column :trade_promote_goods, :over_limit, :boolean, default: false
    remove_column :trade_promote_goods, :state, :string, default: "unused"
    remove_column :trade_promote_goods, :cart_promotes_count, :integer, scale: 4, default: "0"

    add_column :trade_trade_items, :fetch_oneself, :boolean, default: false, comment: "自取"
    add_column :trade_trade_items, :fetch_start_at, :datetime
    add_column :trade_trade_items, :fetch_finish_at, :datetime
    add_column :trade_trade_items, :aim, :string, default: "use"
    remove_column :trade_trade_items, :myself, :boolean
    remove_column :trade_trade_items, :starred, :boolean

    remove_column :auth_disposable_tokens, :token, :string
  end

end
