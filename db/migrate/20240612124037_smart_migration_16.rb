class SmartMigration16 < ActiveRecord::Migration[7.2]

  def change
    add_column :qingflow_forms, :record_name, :string
  end

end
