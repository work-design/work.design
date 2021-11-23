class ExtendMigration7 < ActiveRecord::Migration[7.0]

  def change


    create_table :markdown_assets do |t|
      t.belongs_to :git
      t.string :name
      t.string :path
      t.string :download_url
      t.timestamps
    end

  end

end
