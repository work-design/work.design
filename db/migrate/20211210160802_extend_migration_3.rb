class ExtendMigration3 < ActiveRecord::Migration[7.0]

  def change

    add_column :trade_advances, :open, :boolean, default: false

    add_belongs_to :markdown_catalogs, :organ


    create_table :com_blob_temps do |t|
      t.string :note
      t.timestamps
    end

  end

end
