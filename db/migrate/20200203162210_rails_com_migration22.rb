class RailsComMigration22 < ActiveRecord::Migration[6.0]

  def change




    create_table :stats do |t|
      t.integer :subscribed_requests_count
      t.integer :oauth_users_count
      t.integer :users_count
      t.integer :requirements_count
      t.timestamps
    end











































































































































































  end

end
