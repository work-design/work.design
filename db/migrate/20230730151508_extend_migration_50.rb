class ExtendMigration50 < ActiveRecord::Migration[7.0]

  def change
    add_belongs_to :auth_authorized_tokens, :user
  end

end
