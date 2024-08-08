class RenameProductTaxonsToTaxons < ActiveRecord::Migration[7.2]
  def change
    rename_table :factory_product_taxons, :factory_taxons
  end
end
