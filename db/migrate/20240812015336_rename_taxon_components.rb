class RenameTaxonComponents < ActiveRecord::Migration[7.2]
  def change
    rename_table :factory_taxon_components, :factory_components
    drop_table :factory_product_components

    add_belongs_to :factory_components, :product
  end
end
