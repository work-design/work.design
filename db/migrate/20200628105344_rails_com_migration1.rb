class RailsComMigration1 < ActiveRecord::Migration[6.0]

  def change













































    add_reference :total_carts, :address

































































    add_column :trade_promotes, :status, :string, default: "init"









































































































  end

end
