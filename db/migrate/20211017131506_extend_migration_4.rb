class ExtendMigration4 < ActiveRecord::Migration[7.0]

  def change
    add_belongs_to :markdown_catalogs, :git
  end

end
