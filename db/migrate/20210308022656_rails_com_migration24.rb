class RailsComMigration24 < ActiveRecord::Migration[6.1]

  def change














































































    create_table :productions do |t|
      t.references :product
      t.string :name
      t.string :qr_code
      t.decimal :price, precision: 10, scale: 2, default: 0
      t.decimal :cost_price, default: 0
      t.decimal :profit_price, default: 0
      t.string :str_part_ids
      t.boolean :default
      t.string :state, default: "init"
      t.string :sku
      t.decimal :advance_price, default: 0
      t.json :extra, default: {}
      t.string :unit
      t.decimal :quantity, default: 0
      t.decimal :unified_quantity, default: 0
      t.timestamps
    end

    create_table :production_parts do |t|
      t.references :production
      t.references :part
      t.decimal :price, default: 0
      t.timestamps
    end


    add_column :parts, :part_providers_count, :integer, default: 0

    create_table :production_items do |t|
      t.references :production
      t.references :product_plan
      t.string :state, default: "producing"
      t.string :qr_code
      t.datetime :produced_at
      t.timestamps
    end

    create_table :product_produces do |t|
      t.references :product
      t.references :produce
      t.integer :position
      t.datetime :start_at
      t.datetime :finish_at
      t.timestamps
    end


    add_column :products, :str_part_ids, :string
    add_column :products, :profit_margin, :decimal, precision: 4, scale: 2
    add_column :products, :min_price, :decimal
    add_column :products, :max_price, :decimal


    add_reference :part_taxons, :factory_taxon
    add_column :part_taxons, :parts_count, :integer, default: 0
    remove_column :part_taxons, :max_select, :integer, scale: 4
    remove_column :part_taxons, :min_select, :integer, scale: 4

    add_reference :product_taxons, :factory_taxon
    add_column :product_taxons, :products_count, :integer, default: 0
    remove_column :product_taxons, :profit_margin, :decimal, limit: 2, precision: 4

    create_table :factory_taxons do |t|
      t.string :name
      t.integer :position
      t.timestamps
    end


    add_column :product_parts, :default, :boolean

    create_table :factory_providers do |t|
      t.references :factory_taxon
      t.references :provider
      t.timestamps
    end

    create_table :product_part_taxons do |t|
      t.references :product
      t.references :part_taxon
      t.string :name
      t.integer :min_select, default: 1
      t.integer :max_select, comment: "最大同时选择，1则为单选", default: 1
      t.json :part_taxon_ancestors
      t.timestamps
    end

    create_table :production_carts do |t|
      t.references :cart
      t.references :user
      t.references :product
      t.references :production
      t.string :state, default: "init"
      t.datetime :customized_at
      t.decimal :original_price, default: 0
      t.timestamps
    end


    create_table :part_providers do |t|
      t.references :part
      t.references :product
      t.references :production
      t.references :provider
      t.references :organ
      t.decimal :export_price
      t.boolean :verified
      t.boolean :selected
      t.timestamps
    end




    add_reference :part_plans, :product
    add_reference :part_plans, :production































    add_column :facilitates, :import_price, :decimal, default: 0
    add_column :facilitates, :profit_price, :decimal, default: 0


















    remove_column :role_rules, :controller_name, :string
    remove_column :role_rules, :required_parts, :string




































  end

end
