class AddTargetToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :markdown_posts, :target, :string
  end
end
