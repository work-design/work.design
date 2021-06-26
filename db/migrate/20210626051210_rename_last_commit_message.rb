class RenameLastCommitMessage < ActiveRecord::Migration[6.1]
  def change
    rename_column :markdown_gits, :last_commit_massage, :last_commit_message
  end
end
