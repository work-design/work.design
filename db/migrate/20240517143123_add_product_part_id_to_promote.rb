class AddProductPartIdToPromote < ActiveRecord::Migration[7.1]
  def change
    add_belongs_to :trade_promote_goods, :product_taxon
    add_belongs_to :trade_promote_goods, :part
  end
end
