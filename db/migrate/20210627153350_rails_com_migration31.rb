class RailsComMigration31 < ActiveRecord::Migration[6.1]

  def change



    add_column :markdown_posts, :title, :string
  end

end
