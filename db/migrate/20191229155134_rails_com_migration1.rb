class RailsComMigration1 < ActiveRecord::Migration[6.0]

  def change





















































































































    create_table :quip_apps do |t|
      t.references :user
      t.string :access_token
      t.timestamps
    end





















































  end

end
