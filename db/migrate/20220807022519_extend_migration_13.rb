class ExtendMigration13 < ActiveRecord::Migration[7.0]

  def change

    add_column :wechat_scenes, :aim, :string
  end

end
