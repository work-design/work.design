class SmartMigration21 < ActiveRecord::Migration[7.2]

  def change
    add_column :qingflow_forms, :column_name, :string
  end

end
