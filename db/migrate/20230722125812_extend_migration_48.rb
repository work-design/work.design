class ExtendMigration48 < ActiveRecord::Migration[7.0]

  def change

    add_belongs_to :trade_promote_goods, :maintain
    add_belongs_to :trade_promote_goods, :client
  end

end
