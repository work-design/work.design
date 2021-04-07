class CreateShipFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :ship_favorites do |t|
      t.references :user
      t.references :driver
      t.timestamps
    end
  end
end
