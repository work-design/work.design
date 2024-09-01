class SmartMigration65 < ActiveRecord::Migration[7.2]

  def change
    add_belongs_to :factory_production_parts, :component

  end

end
