class ExtendMigration47 < ActiveRecord::Migration[7.0]

  def change



    add_belongs_to :trade_deliveries, :maintain
    add_belongs_to :trade_deliveries, :client
  end

end
