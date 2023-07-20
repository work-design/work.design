class ExtendMigration45 < ActiveRecord::Migration[7.0]

  def change
    add_belongs_to :profiled_addresses, :maintain
    add_belongs_to :profiled_addresses, :client

    remove_column :profiled_profiles, :maintain_id, :integer, scale: 8
    remove_column :profiled_profiles, :client_id, :integer, scale: 8
  end

end
