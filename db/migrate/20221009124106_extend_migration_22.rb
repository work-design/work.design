class ExtendMigration22 < ActiveRecord::Migration[7.0]

  def change

    add_column :markdown_gits, :secret, :string
    add_column :markdown_gits, :host, :string
  end

end
