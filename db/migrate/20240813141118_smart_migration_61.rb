class SmartMigration61 < ActiveRecord::Migration[7.2]

  def change

    create_table :qingflow_users do |t|
      t.belongs_to :app
      t.string :userid
      t.string :name
      t.string :email
      t.string :mobile
      t.timestamps
    end

    add_column :qingflow_applications, :forms_count, :integer

    add_column :factory_production_parts, :number, :integer

    rename_column :trade_promote_goods, :product_taxon_id, :taxon_id

  end

end
