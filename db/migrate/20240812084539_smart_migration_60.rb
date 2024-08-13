class SmartMigration60 < ActiveRecord::Migration[7.2]

  def change
    rename_column :factory_taxons, :product_part_taxons_count, :taxon_components_count

    add_column :factory_components, :type, :string

    create_table :factory_component_parts do |t|
      t.belongs_to :component
      t.belongs_to :part
      t.boolean :default
      t.timestamps
    end
    drop_table :factory_taxon_parts
    drop_table :factory_product_parts

    rename_column :factory_components, :product_parts_count, :component_parts_count
  end

end
