class SmartMigration19 < ActiveRecord::Migration[7.2]

  def change

    create_table :sync_logs do |t|
      t.belongs_to :item
      t.belongs_to :related, polymorphic: true
      t.string :exception
      t.string :exception_backtrace, array: true
      t.timestamps
    end

    create_table :sync_items do |t|
      t.belongs_to :app
      t.string :identifier, index: true
      t.jsonb :values
      t.integer :logs_count
      t.string :source
      t.timestamps
    end

    create_table :sync_form_hierarchies do |t|
      t.belongs_to :ancestor
      t.belongs_to :descendant
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "sync/form_anc_desc_idx"
    end

    create_table :sync_forms do |t|
      t.belongs_to :parent
      t.belongs_to :app
      t.belongs_to :meta_column
      t.jsonb :parent_ancestors
      t.string :title
      t.string :column_name
      t.string :record_name
      t.boolean :display
      t.boolean :primary
      t.boolean :modeling
      t.string :foreign_key
      t.timestamps
    end

    create_table :sync_audits do |t|
      t.belongs_to :synchro, polymorphic: true
      t.belongs_to :operator, polymorphic: true
      t.belongs_to :destined
      t.jsonb :synchro_params
      t.jsonb :audited_changes
      t.string :operation
      t.string :note
      t.string :state
      t.datetime :apply_at
      t.timestamps
    end

    create_table :sync_apps do |t|
      t.belongs_to :organ
      t.string :name
      t.string :appid, index: true
      t.string :secret
      t.string :access_token
      t.datetime :access_token_expires_at
      t.string :refresh_token
      t.datetime :refresh_token_expires_at
      t.timestamps
    end
    
    add_column :qingflow_items, :source, :string
  end

end
