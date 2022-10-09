class ExtendMigration21 < ActiveRecord::Migration[7.0]

  def change

    add_column :markdown_gits, :identity, :string
  end

end
