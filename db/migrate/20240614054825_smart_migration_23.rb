class SmartMigration23 < ActiveRecord::Migration[7.2]

  def change

    create_table :sync_records do |t|
      t.belongs_to :organ
      t.belongs_to :app
      t.string :name
      t.string :key
      t.timestamps
    end

    add_belongs_to :sync_items, :record
    remove_column :sync_items, :app_id, :integer, limit: 8

    add_belongs_to :sync_forms, :record
    remove_column :sync_forms, :app_id, :integer, limit: 8
  end

end
