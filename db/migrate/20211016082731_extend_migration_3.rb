class ExtendMigration3 < ActiveRecord::Migration[7.0]

  def change
    add_column :markdown_gits, :type, :string

  end

end
