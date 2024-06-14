class SmartMigration22 < ActiveRecord::Migration[7.2]

  def change

    add_belongs_to :sync_items, :organ
    add_belongs_to :sync_forms, :organ
    rename_column :sync_forms, :title, :name
    add_column :sync_forms, :external_column_name, :string
    add_column :sync_forms, :external_record_name, :string
    remove_column :sync_forms, :foreign_key, :string

  end

end
