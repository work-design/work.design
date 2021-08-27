class RailsComMigration1630084032 < ActiveRecord::Migration[6.1]

  def change
    

    add_column :markdown_posts, :published, :boolean, default: true


  end

end
