class SmartMigration57 < ActiveRecord::Migration[7.2]

  def change
    rename_table :factory_product_part_taxons, :factory_taxon_components

    create_table :factory_taxon_hierarchies do |t|
      t.belongs_to :ancestor
      t.belongs_to :descendant
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "factory/taxon_anc_desc_idx"
    end

    rename_column :factory_production_provides, :product_taxon_id, :taxon_id

    create_table :factory_taxon_parts do |t|
      t.belongs_to :taxon
      t.belongs_to :taxon_component
      t.belongs_to :part
      t.boolean :default
      t.timestamps
    end

    remove_column :factory_taxon_components, :product_id, :integer, limit: 8
    rename_column :factory_taxon_components, :product_taxon_id, :taxon_id
    rename_column :factory_provides, :product_taxon_id, :taxon_id
    rename_column :factory_productions, :product_taxon_id, :taxon_id
    rename_column :factory_product_parts, :product_taxon_id, :taxon_id

    add_belongs_to :factory_product_parts, :product_component
    remove_column :factory_product_parts, :product_part_taxon_id, :integer, limit: 8

    create_table :factory_product_components do |t|
      t.belongs_to :product
      t.belongs_to :part_taxon
      t.string :name
      t.integer :min_select
      t.integer :max_select
      t.integer :product_parts_count
      t.timestamps
    end

    rename_column :factory_products, :product_taxon_id, :taxon_id
    rename_column :factory_products, :product_taxon_ancestors, :taxon_ancestors
  end

end
