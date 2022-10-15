class ExtendMigration25 < ActiveRecord::Migration[7.0]

  def change

    add_column :markdown_posts, :home, :boolean, comment: "是否首页，默认为 README.md"
  end

end
