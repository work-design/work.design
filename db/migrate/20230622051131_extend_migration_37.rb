class ExtendMigration37 < ActiveRecord::Migration[7.0]

  def change
    remove_column :trade_items, :organ_ancestor_ids, :jsonb, default: "[]"

    add_column :auth_oauth_users, :agency_oauth, :boolean
  end

end
