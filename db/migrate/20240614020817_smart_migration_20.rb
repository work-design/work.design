class SmartMigration20 < ActiveRecord::Migration[7.2]

  def change
    add_belongs_to :qingflow_items, :organ

    add_belongs_to :qingflow_forms, :organ

    add_belongs_to :qingflow_applications, :organ

  end

end
