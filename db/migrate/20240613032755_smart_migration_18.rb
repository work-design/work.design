class SmartMigration18 < ActiveRecord::Migration[7.2]

  def change
    add_column :qingflow_items, :logs_count, :integer
  end

end
