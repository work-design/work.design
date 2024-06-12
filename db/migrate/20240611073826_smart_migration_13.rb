class SmartMigration13 < ActiveRecord::Migration[7.2]

  def change

    add_column :qingflow_forms, :display, :boolean

  end

end
