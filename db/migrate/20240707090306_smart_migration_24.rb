class SmartMigration24 < ActiveRecord::Migration[7.2]

  def change

    add_column :sync_apps, :type, :string
    add_column :sync_apps, :base_url, :string

    add_column :qingflow_items, :linked_uid, :string
    add_column :qingflow_items, :primary_attrs, :jsonb
    add_column :qingflow_items, :attrs, :jsonb

    add_column :qingflow_forms, :alias_title, :string
    add_column :qingflow_forms, :linked, :boolean

    add_column :qingflow_applications, :last_sync_at, :datetime

    add_column :qingflow_apps, :uuid, :string
    add_column :qingflow_apps, :base_url, :string

    create_table :qingflow_tools do |t|
      t.belongs_to :app
      t.string :type
      t.string :uid
      t.jsonb :request
      t.jsonb :response
      t.timestamps
    end

    create_table :qingflow_linkers do |t|
      t.belongs_to :app
      t.string :type
      t.jsonb :request
      t.jsonb :response
      t.string :record_key
      t.string :operation, array: true
      t.string :uid
      t.timestamps
    end


    add_belongs_to :auth_oauth_users, :organ
  end

end
