class SmartMigration28 < ActiveRecord::Migration[7.2]

  def change
    add_column :qingflow_items, :cached_table, :jsonb
    add_column :qingflow_items, :last_sync_at, :datetime

    create_table :qingflow_groups do |t|
      t.belongs_to :application
      t.string :title
      t.string :description
      t.string :pdf
      t.integer :position
      t.boolean :enabled
      t.timestamps
    end

    add_belongs_to :qingflow_forms, :group
    add_column :qingflow_forms, :alias_title, :string
    add_column :qingflow_forms, :position, :integer
    add_column :qingflow_forms, :record_key, :string
    remove_column :qingflow_forms, :application_id, :integer, limit: 8
    remove_column :qingflow_forms, :exportable, :boolean
    remove_column :qingflow_forms, :group_title, :string

    create_table :qingflow_alias_hierarchies do |t|
      t.belongs_to :ancestor
      t.belongs_to :descendant
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "qingflow/alias_anc_desc_idx"
    end

    add_belongs_to :qingflow_aliases, :parent
    add_column :qingflow_aliases, :parent_ancestors, :jsonb

    add_column :factory_provides, :invite_token, :string

    add_column :factory_products, :profit_margin, :decimal


    add_column :org_organs, :dispatch, :string
  end

end
