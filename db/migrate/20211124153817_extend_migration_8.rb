class ExtendMigration8 < ActiveRecord::Migration[7.0]

  def change


    add_column :org_organs, :code, :string

    add_column :markdown_catalogs, :position, :integer

  end

end
