class SmartMigration5 < ActiveRecord::Migration[7.1]

  def change



    add_belongs_to :factory_product_parts, :product_taxon
    add_belongs_to :factory_product_parts, :product_part_taxon
    remove_column :factory_product_parts, :part_taxon_id, :integer, limit: 8

    add_belongs_to :factory_product_part_taxons, :product_taxon

    add_column :factory_product_taxons, :product_part_taxons_count, :integer

    add_column :factory_products, :base_price, :decimal

    add_belongs_to :trade_promote_goods, :card
    remove_column :trade_promote_goods, :type, :string


    add_column :auth_authorized_tokens, :online_at, :datetime
    add_column :auth_authorized_tokens, :offline_at, :datetime
    remove_column :auth_authorized_tokens, :online, :boolean

    add_column :auth_oauth_users, :online_at, :datetime
    add_column :auth_oauth_users, :offline_at, :datetime
  end

end
