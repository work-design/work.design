class SmartMigration70 < ActiveRecord::Migration[8.0]

  def change
    create_table :com_blob_pdfs do |t|
      t.string :url
      t.timestamps
    end

    add_column :com_acme_orders, :identifiers, :string, array: true

  end

end
