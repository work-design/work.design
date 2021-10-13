class ExtendMigration2 < ActiveRecord::Migration[7.0]

  def change
    remove_column :profiled_profiles, :user_id, :integer, scale: 8
    add_belongs_to :markdown_gits, :organ
  end

end
