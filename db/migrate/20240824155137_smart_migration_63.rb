class SmartMigration63 < ActiveRecord::Migration[7.2]

  def change

    add_belongs_to :factory_component_parts, :taxon
    add_belongs_to :factory_component_parts, :product

  end

end
