class RailsComMigration63 < ActiveRecord::Migration[6.0]

  def change















































































































































































    remove_column :organ_grants, :session_organ_id, :integer, scale: 8






































  end

end
