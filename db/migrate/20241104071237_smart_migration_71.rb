class SmartMigration71 < ActiveRecord::Migration[8.0]

  def change

    add_column :com_meta_models, :table_name, :string

    add_belongs_to :space_rooms, :organ

    add_belongs_to :space_desks, :organ

    add_column :qingflow_users, :active, :boolean
    add_column :qingflow_users, :disabled, :boolean
    add_column :qingflow_users, :last_sync_at, :datetime
    add_column :qingflow_users, :depart_ids, :integer, array: true
    add_column :qingflow_users, :role_ids, :integer, array: true
    add_column :qingflow_users, :uid, :integer

    add_column :qingflow_items, :note, :string

    add_column :qingflow_operations, :code, :string
    add_column :qingflow_operations, :note, :string
    add_column :qingflow_operations, :auditable, :boolean
    add_column :qingflow_operations, :audit_result, :boolean
    add_column :qingflow_operations, :applyid, :string

    add_column :qingflow_apps, :sync_users_at, :datetime

    create_table :bluetooth_errs do |t|
      t.belongs_to :organ
      t.string :name
      t.timestamps
    end

  end

end
