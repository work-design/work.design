class ExtendMigration5 < ActiveRecord::Migration[7.0]

  def change


    add_column :factory_products, :enabled, :boolean, default: false

    add_column :factory_product_taxons, :enabled, :boolean, default: true



  end

end
