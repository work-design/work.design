class AddGitToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :markdown_posts, :git
  end
end
