class SmartMigration72 < ActiveRecord::Migration[8.0]

  def change

    add_belongs_to :com_states, :parent
    add_column :com_states, :parent_ancestors, :jsonb

    add_column :com_err_bots, :secret, :string

    create_table :roled_tabs do |t|
      t.belongs_to :role
      t.string :name
      t.string :path
      t.string :icon
      t.integer :position
      t.timestamps
    end

    create_table :datum_validations do |t|
      t.belongs_to :template
      t.string :sheet
      t.string :header
      t.jsonb :fields
      t.timestamps
    end

    create_table :datum_template_items do |t|
      t.belongs_to :template
      t.jsonb :fields
      t.integer :position
      t.timestamps
    end

    create_table :datum_templates do |t|
      t.belongs_to :organ
      t.string :name
      t.jsonb :headers
      t.integer :header_line
      t.integer :template_items_count
      t.jsonb :parameters
      t.timestamps
    end

    create_table :datum_export_items do |t|
      t.belongs_to :export
      t.jsonb :fields
      t.integer :position
      t.jsonb :extra
      t.timestamps
    end

    create_table :datum_exports do |t|
      t.belongs_to :template
      t.string :name
      t.timestamps
    end

    create_table :alipay_apps do |t|
      t.belongs_to :organ
      t.string :type
      t.string :name
      t.string :appid
      t.string :private_rsa
      t.timestamps
    end

    add_belongs_to :wechat_payee_apps, :organ

    add_column :qingflow_versions, :sync_forms_at, :datetime

    create_table :qingflow_item_statistics do |t|
      t.belongs_to :item
      t.string :key
      t.jsonb :params
      t.jsonb :result
      t.timestamps
    end

    add_column :qingflow_items, :uid, :string
    add_column :qingflow_items, :code_answers, :jsonb
    add_column :qingflow_items, :params, :jsonb

    add_column :qingflow_forms, :full_title, :string
    add_column :qingflow_forms, :required, :boolean
    add_column :qingflow_forms, :synced_at, :datetime

    create_table :qingflow_export_items do |t|
      t.belongs_to :export
      t.string :uid
      t.jsonb :fields
      t.integer :position
      t.boolean :header
      t.string :record_key
      t.integer :repeat_index
      t.timestamps
    end

    create_table :qingflow_exports do |t|
      t.belongs_to :application
      t.belongs_to :template
      t.string :name
      t.jsonb :headers
      t.integer :header_line
      t.integer :export_items_count
      t.jsonb :parameters
      t.jsonb :uids
      t.datetime :uploaded_at
      t.timestamps
    end

    add_column :qingflow_applications, :job_id, :string

    add_column :qingflow_aliases, :synced_at, :datetime

    add_belongs_to :qingflow_operations, :app
    add_column :qingflow_operations, :syncing, :boolean
    add_column :qingflow_operations, :linker_type, :string
    add_column :qingflow_operations, :record_key, :string

    create_table :factory_production_spaces do |t|
      t.belongs_to :production
      t.belongs_to :grid
      t.belongs_to :room
      t.belongs_to :desk
      t.belongs_to :building
      t.belongs_to :station
      t.timestamps
    end

    add_belongs_to :trade_carts, :desk
    add_belongs_to :trade_carts, :station

    drop_table :requirements
  end

end
