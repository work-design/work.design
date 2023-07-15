class ExtendMigration39 < ActiveRecord::Migration[7.0]

  def change
    add_column :factory_productions, :link, :string
  end

end
