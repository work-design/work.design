class SmartMigration14 < ActiveRecord::Migration[7.2]

  def change
    add_column :qingflow_forms, :primary, :boolean
  end

end
