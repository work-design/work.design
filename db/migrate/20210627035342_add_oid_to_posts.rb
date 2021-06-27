class AddOidToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :markdown_posts, :oid, :string
  end
end
