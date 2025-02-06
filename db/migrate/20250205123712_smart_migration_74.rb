class SmartMigration74 < ActiveRecord::Migration[8.0]

  def change

    create_table :roled_role_whos do |t|
      t.belongs_to :role
      t.belongs_to :who, polymorphic: true
      t.timestamps
    end

    create_table :roled_cache_roles do |t|
      t.belongs_to :role
      t.belongs_to :cache
      t.timestamps
    end

    create_table :roled_caches do |t|
      t.string :str_role_ids, index: true
      t.jsonb :role_hash
      t.timestamps
    end

    add_belongs_to :roled_roles, :organ
    remove_column :roled_roles, :type, :string

    add_column :com_meta_controllers, :synced_at, :datetime

    add_column :com_meta_businesses, :synced_at, :datetime

    add_column :com_meta_actions, :synced_at, :datetime

    add_column :datum_exports, :formats, :jsonb

    remove_column :bench_facilitate_providers, :export_price, :decimal

    remove_column :bench_facilitates, :import_price, :decimal, default: "0.0"
    remove_column :bench_facilitates, :profit_price, :decimal, default: "0.0"

    create_table :qingflow_item_temps do |t|
      t.string :record_key
      t.jsonb :params
      t.string :uid
      t.string :state
      t.timestamps
    end

    add_column :qingflow_items, :apply_update_at, :datetime

    add_column :qingflow_forms, :options, :jsonb

    create_table :qingflow_export_users do |t|
      t.belongs_to :export
      t.jsonb :filter
      t.jsonb :table_filter
      t.jsonb :import_filter
      t.string :email
      t.jsonb :uids
      t.datetime :uploaded_at
      t.integer :export_items_count
      t.timestamps
    end

    add_belongs_to :qingflow_export_items, :export_user
    remove_column :qingflow_export_items, :export_id, :integer, limit: 8

    add_column :qingflow_exports, :formats, :jsonb
    remove_column :qingflow_exports, :headers, :jsonb
    remove_column :qingflow_exports, :header_line, :integer, limit: 4
    remove_column :qingflow_exports, :export_items_count, :integer, limit: 4
    remove_column :qingflow_exports, :uids, :jsonb
    remove_column :qingflow_exports, :uploaded_at, :datetime, precision: 6
    remove_column :qingflow_exports, :filter, :jsonb

    add_column :qingflow_applications, :tag_str, :string

    add_column :qingflow_aliases, :options, :jsonb

    remove_column :factory_taxons, :template_id, :integer, limit: 8

    add_belongs_to :factory_scenes, :organ


    add_belongs_to :trade_orders, :desk

    remove_column :eventual_events, :price, :decimal, precision: 10, scale: 2

    create_table :org_shortcuts do |t|
      t.belongs_to :member
      t.string :controller
      t.string :action
      t.string :business
      t.string :namespace
      t.timestamps
    end

    add_belongs_to :org_organs, :cache

    add_belongs_to :org_members, :cache

    add_belongs_to :auth_users, :cache
  end

end
