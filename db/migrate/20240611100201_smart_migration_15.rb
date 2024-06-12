class SmartMigration15 < ActiveRecord::Migration[7.2]

  def change
    add_column :qingflow_forms, :modeling, :boolean
  end

end
