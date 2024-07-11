class SmartMigration26 < ActiveRecord::Migration[7.2]

  def change


    create_table :qingflow_versions do |t|
      t.belongs_to :app
      t.string :key
      t.string :name
      t.string :number
      t.string :linker
      t.timestamps
    end

    add_belongs_to :qingflow_items, :version
    add_column :qingflow_items, :record_key, :string
    add_column :qingflow_items, :cached_answers, :jsonb
    add_column :qingflow_items, :version_answers, :jsonb
    remove_column :qingflow_items, :application_id, :integer, limit: 8

    add_column :qingflow_forms, :exportable, :boolean
    remove_column :qingflow_forms, :alias_title, :string

    create_table :qingflow_aliases do |t|
      t.belongs_to :version
      t.string :title
      t.integer :queid
      t.integer :que_type
      t.timestamps
    end

    add_column :qingflow_linkers, :version_number, :string
    add_column :qingflow_linkers, :source, :string
    remove_column :qingflow_linkers, :record_key, :string
  end

end
